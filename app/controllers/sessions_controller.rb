class SessionsController < ApplicationController

  def new
    @session = session[:email]
    unless current_user.nil?
      flash[:failure] = "You are already logged in"
      if current_user
        user_path(current_user)
      else
        redirect_to welcome_path
      end
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You are logged in"
        redirect_to user_path(user)
    else
      flash[:failure] = "Bad log in credentials"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "You have been logged out"
    redirect_to welcome_path
  end

end
