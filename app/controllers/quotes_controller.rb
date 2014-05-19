class QuotesController < ApplicationController

  def index
    @user = current_user
    @quotes = @user.quotes
  end

  def new
    @user = User.find(params[:user_id])
    @quote = @user.quotes.new

    if @user.quotes.count == 0
      render 'first_quote'
    else
      render 'new'#, layout: false
    end
    
  end

  def create
    @user = User.find(params[:user_id])
    @quote = @user.quotes.new(quote_params)

    if @quote.save
      redirect_to user_quotes_path(@user)
    else
      render 'new'
    end
  end

  def show 
    @user = current_user
    @quote = @user.quotes.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @quote = @user.quotes.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @quote = @user.quotes.find(params[:id])

    if @quote.update(quote_params)
      redirect_to user_quotes_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @quote = @user.quotes.find(params[:id])
    @quote.destroy

    redirect_to user_quotes_path(@user)
  end

  def first_quote
  end

  private
    def quote_params
      params.require(:quote).permit(:body, :author)
    end

end
