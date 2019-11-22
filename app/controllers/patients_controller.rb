class PatientsController < ApplicationController
  before_action :find_patient, only: :show

  def show; end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new patient_params
    if @patient.save
      flash[:success] = t "welcome_app"
      redirect_to @patient
    else
      render :new
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
end
