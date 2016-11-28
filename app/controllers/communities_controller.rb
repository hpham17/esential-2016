class CommunitiesController < ApplicationController
  before_action :authenticate_user!
  before_filter :is_community?, only: [:edit, :new, :destroy]
  def index
    @communities = Community.all.order('id ASC')
    respond_to do |format|
      format.html
      format.json { render :json => @communities }
    end
  end
  def show
    @community = Community.find(params[:id])
    @loan = LoanRequest.new
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])
    if @community.update_attributes community_params
      redirect_to dashboard_path
    end
  end

  def new
    @community = Community.new
    @community.build_address
  end

  def create
    @community = Community.new community_params
    if @community.save
      redirect_to dashboard_path
    else
      flash[:error] = "Please fill out required fields."
      redirect_to :back
    end
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    flash[:notice] = "#{@community.name} was successfully deleted."
    redirect_to dashboard_path
  end

  private
  def is_community?
    if !current_user.is?(:Community) || !current_user.community.nil?
      flash[:error] = "You cannot do this action."
      redirect_to dashboard_path
    end
  end

  def community_params
    params.require(:community).permit(:name, :description, :total_loan_amount, :interest_rate, :terms, :max_loan_amount, :loan_period, :number, :email, :website, :user_id, images_attributes: [:location], address_attributes: [:house_number, :street, :city, :state, :zip] )
  end
end
