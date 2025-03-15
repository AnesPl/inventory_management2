class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to dashboard_path  # or any other page
    else
      # Render the login form
    end
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  # Store user ID in session
      flash[:notice] = "Logged in successfully."
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)  # Log out the user
    redirect_to root_path, notice: 'Logged out successfully'
  end
end
