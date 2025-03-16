class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

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
      Rails.logger.debug @user.errors.full_messages  # Logs the errors to console
      render :new  # Re-renders the new form with the @user object containing errors
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
