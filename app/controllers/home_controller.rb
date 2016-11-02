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
    elsif current_user.role == 'Community'
      @community = current_user.community
      render 'communityDashboard'
    else
      root_path
    end
  end
end
