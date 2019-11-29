module AppointmentHelper
  def doctors
    Doctor.pluck :full_name, :id
  end

  def to_time_all
    ShiftWork.pluck :to_time, :id
  end

  def from_time_all
    ShiftWork.pluck :from_time, :id
  end
end
