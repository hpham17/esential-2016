class HomeController < ApplicationController
  def index
    if user_signed_in?
      @data = User.all
      render 'borrowerDashboard'
    end
    
    
    
  end
  
  def borrowerDashboard
    if user_signed_in?
      render 'borrowerDashboard'
    end
  end
  

end
