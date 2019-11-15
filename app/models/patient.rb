class Patient < User
  has_many :comments, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :medical_records, dependent: :destroy
end
