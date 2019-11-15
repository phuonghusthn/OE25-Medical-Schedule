class Staff < User
  has_many :news, dependent: :destroy
end
