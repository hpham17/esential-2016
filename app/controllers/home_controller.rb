class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.role == 'Admin'
      @users = User.all
      @communities = Community.all
      render 'adminDashboard'
    elsif current_user.role == 'Borrower'
      @communities = Community.all
      render 'borrowerDashboard'
    else
    end
  end


end
