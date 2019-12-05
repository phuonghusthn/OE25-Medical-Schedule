class AccountActivationsController < ApplicationController
  before_action :find_patient, only: :edit

  def edit
    if !@patient.activated? &&
       @patient.authenticated?(:activation, params[:id])
      @patient.activate
      log_in @patient
      flash[:success] = t "activated"
      redirect_to @patient
    else
      flash[:danger] = t "invalid_link"
      redirect_to root_url
    end
  end

  private

  def find_patient
    return if @patient = Patient.find_by(email: params[:email])

    flash[:danger] = t "not_found"
    redirect_to root_url
  end
end
