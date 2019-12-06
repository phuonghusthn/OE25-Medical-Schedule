class PatientsController < ApplicationController
  before_action :find_patient, only: %i(show edit update)
  before_action :correct_patient, :logged_in_user, only: %i(edit update)

  def show; end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new patient_params
    if @patient.save
      @patient.send_activation_email
      flash[:info] = t "check_mail"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @patient.update patient_params
      flash[:success] = t "profile_updated"
      redirect_to @patient
    else
      flash[:danger] = t "not_success"
      render :edit
    end
  end

  private

  def patient_params
    params.require(:patient).permit Patient::PATIENT_PARAMS
  end

  def find_patient
    return if @patient = Patient.find_by(id: params[:id])

    flash[:danger] = t "not_found"
    redirect_to root_url
  end

  def correct_patient
    redirect_to(root_url) unless current_user? @patient
  end
end
