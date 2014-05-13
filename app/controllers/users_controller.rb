class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to @user
    else
      render 'new'
    end

  end

  def show 
    @user = User.find(params[:id])
  end

  def handle
    @user = User.find_by(handle: params[:handle])
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:handle, :email, :password, :password_confirmation, :first_name, :last_name, :age, :date_of_birth, :bio)
    end
end
