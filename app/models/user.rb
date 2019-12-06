class User < ApplicationRecord
  self.inheritance_column = :role

  attr_accessor :remember_token, :activation_token, :reset_token

  VALID_EMAIL_REGEX = Settings.valid_email_regex
  VALID_PHONE_REGEX = Settings.valid_phone_regex

  before_save :downcase_email
  before_create :create_activation_digest

  validates :user_name, presence: true,
    length: {maximum: Settings.max_user_name}
  validates :email, presence: true, length: {maximum: Settings.max_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true, length: {minimum: Settings.min_pass},
    allow_nil: true

  class << self
    def roles
      %w(Admin Staff Doctor Patient)
    end
  end

  %w(Admin Staff Doctor Patient).each do |klass|
    define_method "#{klass.downcase}?" do
      self.class.name == klass
    end
  end

  has_secure_password
  has_one_attached :image

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false unless digest

    BCrypt::Password.new(digest).is_password? token
  end

  def forget
    update remember_digest: nil
  end

  def activate
    update activated: true, activated_at: Time.zone.now
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < Settings.time_expired.hours.ago
  end

  private

  def downcase_email
    email.downcase!
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
