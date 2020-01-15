class New < ApplicationRecord
  NEW_PARAMS = %i(staff_id title content).freeze
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :staff

  has_many_attached :images

  scope :order_by_title, ->{order title: :asc}

  def display_image
    image.variant resize_to_limit: Settings.resize_to_limit
  end
end
