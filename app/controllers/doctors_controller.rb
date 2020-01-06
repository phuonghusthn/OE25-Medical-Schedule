class DoctorsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :load_doctor, only: %i(show edit update)
  before_action :correct_doctor, only: %i(edit update)

  def index
    @doctors = if params[:search].blank?
                 Doctor.page(params[:page]).per Settings.page_size
               else
                 Doctor.search_by_name(params[:search])
                       .page(params[:page]).per Settings.page_size
               end
  end

  def edit; end

  def update
    ActiveRecord::Base.transaction do
      @doctor.update! doctor_params
      @doctor.attach_image params, :doctor
    end
    flash[:success] = t "profile_updated"
    redirect_to @doctor
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = t "not_success"
    render :edit
  end

  def show; end

  private

  def doctor_params
    params.require(:doctor).permit Doctor::DOCTOR_PARAMS
  end

  def load_doctor
    return if @doctor = Doctor.find_by(id: params[:id])

    flash[:danger] = t "not_found"
    redirect_to doctors_path
  end

  def correct_doctor
    return unless current_user.doctor? || current_user.patient?

    redirect_to(root_url) unless current_user? @doctor
  end
end
