class Appointment < ApplicationRecord
  APPOINTMENT_PARAMS = %i(phone_patient address_patient doctor_id day from_time
    to_time message medical_record).freeze

  belongs_to :patient
  belongs_to :doctor

  has_one_attached :medical_record

  validates :phone_patient, presence: true,
    length: {maximum: Settings.max_phone}
  validates :address_patient, presence: true,
    length: {maximum: Settings.max_address}
  validates :day, presence: true
  validates :medical_record,
            content_type: {in: Settings.content_type_file,
                           message: I18n.t("must_be_a_valid_file_format")},
            size: {less_than: Settings.size_file.megabytes,
                   message: I18n.t("should_be_less_than_5MB")}
end
