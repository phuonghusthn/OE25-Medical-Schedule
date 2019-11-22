class DoctorsController < ApplicationController
  before_action :load_doctor, only: :show

  def index
    @doctors = Doctor.page(params[:page]).per Settings.page_size
  end

  def new
    @doctor = Doctor.new
  end

  def create; end

  def show; end

  private

  def load_doctor
    return if @doctor = Doctor.find_by(id: params[:id])

    flash[:danger] = t "not_found"
    redirect_to doctors_path
  end
end
