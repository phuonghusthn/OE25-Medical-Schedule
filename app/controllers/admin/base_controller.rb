class Admin::BaseController < ApplicationController
  before_action :logged_in_user, :is_admin?
  layout "admins"

  private

  def is_admin?
    return if current_user.admin?

    redirect_to root_url
    flash[:danger] = t "you_are_not_authorized_to_access_this_page"
  end
end
