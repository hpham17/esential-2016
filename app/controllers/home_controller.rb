class HomeController < ApplicationController
  def index
    if user_signed_in?
      
      render 'adminDashboard'
      @data = User.all
      
    end
  end
  
end
