class AdminsController < ApplicationController
  before_action :logged_in_user

  layout "admins"

  def index; end
end
