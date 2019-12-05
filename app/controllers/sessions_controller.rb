class SessionsController < ApplicationController
  before_action :session_params, only: :create

  def new; end

  def create
    if @user.authenticate params[:session][:password]
      signin_activated
    else
      flash.now[:danger] = t "invalid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def session_params
    @user = User.find_by email: params[:session][:email].downcase
    return if @user

    flash.now[:danger] = t "invalid"
    render :new
  end

  def signin_activated
    if @user.patient?
      if @user.activated?
        log_in @user
        remember_activated
      else
        flash[:warning] = t "not_active"
        redirect_to root_url
      end
    else
      log_in @user
      remember_activated
    end
  end

  def remember_activated
    if params[:session][:remember_me] == Settings.session_params
      remember @user
    else
      forget @user
    end
    redirect_back_or @user
  end
end
