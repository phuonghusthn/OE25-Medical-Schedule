class New < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :staff
end
