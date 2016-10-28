class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'borrowerDashboard'
      
      @data = User.all
      puts '11111111'
      puts '11111111'
      puts '11111111'
      puts '11111111'
      puts '11111111'
      puts @data
    end
      
    render index
    
  end
  
  def borrowerDashboard
    if user_signed_in?
      render 'borrowerDashboard'
    end
  end
  

end
