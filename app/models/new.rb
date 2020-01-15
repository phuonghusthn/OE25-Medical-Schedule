class New < ApplicationRecord
  NEW_PARAMS = %i(title content staff_id).freeze

  include Image

  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :staff

  has_many_attached :images

  validates :title, presence: true
  validates :content, presence: true

  scope :order_by_title, ->{order title: :asc}
  scope :order_by_create_at, ->{order created_at: :desc}

  def display_image
    image.variant resize_to_limit: Settings.resize_to_limit
  end

  def display_big_image
    images.each do |image|
      image.variant resize_to_limit: Settings.resize_news_image
    end
  end

  def display_small_image
    images.each do |image|
      image.variant resize_to_limit: Settings.resize_to_limit
    end
  end
end
