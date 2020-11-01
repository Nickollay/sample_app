class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:path_info].present?
        redirect_to cookies[:path_info]
      else
        redirect_to tests_path
      end
    else
      flash.now[:alert] = 'Are you a Guru? Please, verify your password and email!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    render :new
  end
end
