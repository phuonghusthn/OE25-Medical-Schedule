class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :admin

  layout "admins"

end
