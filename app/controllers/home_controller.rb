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
      @community = current_user.community
      @community.images.build
      render 'communityDashboard'
    end
  end
  def upload
    uploaded_io = params[:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    render json: params[:file].original_filename
  end
end
