class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'borrowerDashboard'
      puts '!!!!!!!'
      puts '!!!!!!!'
      puts '!!!!!!!'
      puts '!!!!!!!'
      puts '!!!!!!!'
      puts  current_user
    end
      
    
  end
  
  def borrowerDashboard
    if user_signed_in?
      render 'borrowerDashboard'
    end
  end
  

end
