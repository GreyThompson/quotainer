class SessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to user_quotes_path(@user), notice: 'Logged in!'
    else
      render 'new', notice: 'Invalid Login'
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged out!'
  end

end
