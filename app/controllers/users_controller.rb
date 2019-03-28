class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if User.find_by(email: user_params[:email])
      flash[:failure] = "That email is already in use"
      redirect_to new_user_path and return
    end
    @user = User.create(user_params)
    session[:user_id] = @user.id

    if @user.save
      redirect_to welcome_path and return
    else
      flash[:failure] = "Password confirmation failed"
      redirect_to new_user_path and return
    end

  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end
