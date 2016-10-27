class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'borrowerDashboard'
    end
  end
  
  def borrowerDashboard
  end

end
