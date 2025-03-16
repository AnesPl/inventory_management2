class ApplicationController < ActionController::Base
  before_action :require_login  # Protects all pages by default

  helper_method :current_user  # Allows use of `current_user` in views

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:error] = "Please log in first"
      redirect_to login_path  # Redirect to login page if not authenticated
    end
  end
end
