class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  def dashboard
    if current_user.role == 'Admin'
      @users = User.all
      @communities = Community.all
      render 'admin_dashboard'
    elsif current_user.role == 'Borrower'
      if !params[:search_name].blank?
        @communities = Community.where("name LIKE ?", "%#{params[:search_name]}%")
      elsif !params[:search_zipcode].blank?
        @communities = Community.where(:zipcode => params[:search_zipcode])
      else
        @communities = Community.order('name ASC')
      end
      render 'borrower_dashboard'
    else
      @community = current_user.community
      if !current_user.community.nil?
        @community.images.build
      end
      render 'community_dashboard'
    end
  end
  def show
    @user = User.find(params[:id])
  end


end
