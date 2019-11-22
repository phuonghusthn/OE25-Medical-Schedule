class Patient < User
  VALID_EMAIL_REGEX = Settings.valid_email_regex
  PATIENT_PARAMS = %i(user_name email password password_confirmation).freeze

  has_many :comments, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :medical_records, dependent: :destroy

  validates :user_name, presence: true,
    length: {maximum: Settings.max_user_name}
  validates :email, presence: true, length: {maximum: Settings.max_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true, length: {minimum: Settings.min_pass},
    allow_nil: true
end
