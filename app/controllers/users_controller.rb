class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      UserMailer.delay.welcome_email(@user)
      redirect_to new_user_quote_path(@user)
    else
      render 'new'
    end

  end

  def handle
    @user = User.find_by(handle: params[:handle])
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
