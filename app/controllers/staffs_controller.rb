class StaffsController < ApplicationController
  before_action :load_staff, only: %i(show edit update)
  before_action :correct_staff, :logged_in_user, only: %i(edit update)

  def show; end

  def new
    @staff = Staff.new
  end

  def edit; end

  def update
    ActiveRecord::Base.transaction do
      @staff.update! staff_params
      @staff.attach_image params, :staff
    end
    flash[:success] = t "profile_updated"
    redirect_to @staff
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = t "not_success"
    render :edit
  end

  private

  def staff_params
    params.require(:staff).permit Staff::STAFF_PARAMS
  end

  def load_staff
    return if @staff = Staff.find_by(id: params[:id])

    flash[:danger] = t "not_found"
    redirect_to staffs_path
  end

  def correct_staff
    redirect_to(root_url) unless current_user? @staff
  end
end
