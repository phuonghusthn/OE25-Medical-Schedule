class AppointmentsController < ApplicationController
  before_action :logged_in_user, only: %i(create)

  def new
    @appointment = Appointment.new
  end

  def edit; end

  def create
    @appointment = current_user.appointments.build appointment_params
    @appointment.medical_record.attach params[:appointment][:medical_record]
    created_appointment
  end

  private

  def appointment_params
    params.require(:appointment).permit Appointment::APPOINTMENT_PARAMS
  end

  def created_appointment
    if @appointment.save
      flash[:success] = t "appointment_created"
      redirect_to root_url
    else
      flash[:danger] = t "appointment_not_created"
      render :new
    end
  end
end
