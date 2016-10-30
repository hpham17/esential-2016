class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'adminDashboard'
      
      @data = User.all
    end
      
    #render index
  end
  
  def adminDashboard
    if user_signed_in?
      render 'adminDashboard'
    end
  end
  
end
