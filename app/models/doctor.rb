class Doctor < User
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :shift_works, dependent: :destroy
  has_many :rates, dependent: :destroy
  scope :search_by_name, (lambda do |parameter|
    where("full_name LIKE :search", search: "%#{parameter}%")
  end)
end
