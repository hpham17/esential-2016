class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  def dashboard
    if current_user.role == 'Admin'
      @users = User.all
      @communities = Community.all
      render 'admin_dashboard'
    elsif current_user.role == 'Borrower'
      @communities = Community.all
      render 'borrower_dashboard'
    else
      @community = current_user.community
      @community.images.build
      render 'community_dashboard'
    end
  end
  def show
    @user = User.find(params[:id])
  end


end
