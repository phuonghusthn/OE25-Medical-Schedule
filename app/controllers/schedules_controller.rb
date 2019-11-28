class SchedulesController < ApplicationController
  def index
    @appointment = current_user.appointments
  end
end
