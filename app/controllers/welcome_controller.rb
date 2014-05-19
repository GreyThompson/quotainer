class WelcomeController < ApplicationController
  skip_before_filter :require_login

  def index
    render 'index', layout: 'homepage'
  end
end
