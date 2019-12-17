module AppointmentHelper
  def doctors
    Doctor.pluck :full_name, :id
  end

  def to_time_all
    ShiftWork.all.map{|i| [I18n.l(i.end_time, format: :short), i.end_time]}
  end

  def from_time_all
    ShiftWork.all.map{|i| [I18n.l(i.start_time, format: :short), i.start_time]}
  end
end
