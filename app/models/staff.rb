class Staff < User
  STAFF_PARAMS = %i(user_name full_name email phone address
    password password_confirmation).freeze

  has_many :news, dependent: :destroy
end
