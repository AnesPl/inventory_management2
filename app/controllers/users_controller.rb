class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]  # Allow login and sign-up

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account created successfully!"
      redirect_to dashboard_path
    else
      flash[:error] = "There was a problem creating the account."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil  # Clear session on logout
    flash[:notice] = "Logged out successfully."
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
