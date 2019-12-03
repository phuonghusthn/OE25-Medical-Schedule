class SchedulesController < ApplicationController
  before_action :logged_in_user, only: %i(index)
  before_action :check_patient, only: %i(index)

  def index
    @appointment = current_user.appointments
  end

  private

  def check_patient
    return unless current_user.patient?

    flash[:danger] = t "not_allowed"
    redirect_to root_path
  end
end
