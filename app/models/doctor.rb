class Doctor < User
  DOCTOR_PARAMS = %i(user_name full_name email phone address position
    experience room description password password_confirmation).freeze

  ratyrate_rateable "quality"

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :shift_works, dependent: :destroy

  scope :search_by_name, (lambda do |parameter|
    where("full_name LIKE :search", search: "%#{parameter}%")
  end)
end
