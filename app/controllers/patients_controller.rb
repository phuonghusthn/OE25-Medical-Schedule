class PatientsController < ApplicationController
  before_action :find_patient, only: %i(show edit update)
  before_action :correct_patient, :logged_in_user, only: %i(edit update)

  def show; end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new patient_params
    ActiveRecord::Base.transaction do
      @patient.save
      @patient.attach_image params, :patient
    end
    @patient.send_activation_email
    flash[:info] = t "check_mail"
    redirect_to root_url
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def edit; end

  def update
    ActiveRecord::Base.transaction do
      @patient.update! patient_params
      @patient.attach_image params, :patient
    end
    flash[:success] = t "profile_updated"
    redirect_to @patient
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = t "not_success"
    render :edit
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
