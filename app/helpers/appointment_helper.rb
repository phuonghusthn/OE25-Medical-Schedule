module AppointmentHelper
  def doctors
    Doctor.pluck :full_name, :id
  end

  def to_time_all
    ShiftWork.pluck :end_time, :id
  end

  def from_time_all
    ShiftWork.pluck :start_time, :id
  end
end
