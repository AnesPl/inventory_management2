class ApplicationController < ActionController::Base
  before_action :require_login, except: [:new, :create]  # Allow access to login and register actions

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:error] = "Please log in first"
      redirect_to login_path  # Redirect to the login page if the user is not logged in
    end
  end
end

