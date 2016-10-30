class HomeController < ApplicationController
  def index
    if user.role == 'Admin'
      
      render 'adminDashboard'
      @data = User.all
      
    end
    if user.role == 'Borrower'
      render 'borrowerDashboard'
      @data = User.all
    end
  end
  
end
