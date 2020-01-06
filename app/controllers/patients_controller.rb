class PatientsController < ApplicationController
  before_action :authenticate_user!, :find_patient, only: :show

  def show; end

  private

  def find_patient
    return if @patient = Patient.find_by(id: params[:id])

    flash[:danger] = t "not_found"
    redirect_to root_url
  end
end
