class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: session_params[:email]).first
    if user
      session[:user_id] = user.id
      flash.notice = 'Login successful.'
      redirect_to root_path and return
    else
      flash.alert = 'Login failed. Does user exist?'
      redirect_to [:new, :session]
    end
  end

  def destroy
    session[:user_id] = nil
  end

  private

  def session_params
    params.fetch(:session, {}).permit(:email, :password)
  end
end
