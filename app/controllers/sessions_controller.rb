class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]  # Allow login and sign-up
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)  # Clear user session
    flash[:notice] = "Logged out successfully."
    redirect_to login_path  # Redirect to login page after logout
  end

  private

  def redirect_if_logged_in
    redirect_to dashboard_path if current_user
  end
end
