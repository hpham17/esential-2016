class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'borrowerDashboard'
<<<<<<< HEAD
      puts '!!!!!!!'
      puts '!!!!!!!'
      puts '!!!!!!!'
      puts '!!!!!!!'
      puts '!!!!!!!'
      puts  current_user
    end
      
    
=======
    end
  end
  
  def borrowerDashboard
>>>>>>> 8f88bab87767795ee0ba4bd30a0b3ae6c4b0fb93
  end
  
  def borrowerDashboard
    if user_signed_in?
      render 'borrowerDashboard'
    end
  end
  

end
