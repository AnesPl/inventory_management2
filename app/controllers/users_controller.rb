class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  # Store user ID in session
      flash[:notice] = "Logged in successfully."
      redirect_to dashboard_path
    else
      flash[:alert] = "Invalid email or password."
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
