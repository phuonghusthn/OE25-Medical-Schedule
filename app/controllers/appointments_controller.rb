class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def edit; end
end
