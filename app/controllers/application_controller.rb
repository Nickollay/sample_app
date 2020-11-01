class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless logged_in?
      cookies[:path_info] = request.env['PATH_INFO']

      redirect_to login_path, alert: 'Are you a Guru? Please, verify your password and email!'
    end

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def logged_in?
    current_user.present?
  end
end
