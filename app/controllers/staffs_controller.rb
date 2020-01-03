class StaffsController < ApplicationController
  before_action :authenticate_user!, :load_staff, only: :show

  def show; end

  private

  def load_staff
    return if @staff = Staff.find_by(id: params[:id])

    flash[:danger] = t "not_found"
    redirect_to staffs_path
  end
end
