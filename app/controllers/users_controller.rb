class UsersController < ApplicationController
  before_action :authorize_admin, only: [:index, :show] # Only admins can access these pages
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all  # Admin sees all users
  end

  def show
    @user = User.find(params[:id])
    @categories = @user.categories
    @products = @user.products
  end

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
      Rails.logger.debug @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def authorize_admin
    redirect_to root_path, alert: "Access denied!" unless current_user&.admin?
  end
end
