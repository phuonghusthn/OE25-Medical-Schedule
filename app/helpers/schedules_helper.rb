module SchedulesHelper
  def load_schedule
    events_a = []
    @appointment&.map do |t|
      start_t = (t.day.to_s + " " + t.start_time.strftime("%H:%M:%S"))
      end_t = (t.day.to_s + " " + t.end_time.strftime("%H:%M:%S"))
      events_a << {title: t.patient.user_name, start: start_t, end: end_t}
    end
    events_a
  end
end
