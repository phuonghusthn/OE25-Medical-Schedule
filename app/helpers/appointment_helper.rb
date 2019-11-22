module AppointmentHelper
  def doctors
    Doctor.pluck :user_name, :id
  end

  def to_time_all
    Appointment.pluck :to_time, :id
  end

  def from_time_all
    Appointment.pluck :from_time, :id
  end
end
