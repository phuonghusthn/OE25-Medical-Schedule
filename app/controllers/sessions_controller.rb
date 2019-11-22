class SessionsController < ApplicationController
  before_action :session_params, only: :create

  def new; end

  def create
    if @patient.authenticate params[:session][:password]
      log_in patient
      redirect_to patient
    else
      flash.now[:danger] = t "invalid"
      render :new
    end
  end

  def destroy; end

  private

  def session_params
    @patient = Patient.find_by email: params[:session][:email].downcase
    return if @patient

    flash.now[:danger] = t "invalid"
    render :new
  end
end
