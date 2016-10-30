class HomeController < ApplicationController
  def index
    if current_user.role == 'Admin'
      @users = User.all
      @communities = Community.all
      render 'adminDashboard'
    elsif current_user.role == 'Borrower'
      @communities = Community.all
      render 'borrowerDashboard'
    else
      render 'communityDashboard'
    end
  end


end
