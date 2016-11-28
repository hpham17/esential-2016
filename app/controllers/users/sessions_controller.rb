class Users::SessionsController < Devise::SessionsController
  before_filter ->{ authenticate_user!( force: true ) }, only: [:dashboard, :show, :zipcodes]
  def dashboard
    @loan = LoanRequest.new
    if current_user.is? :Admin
      @users = User.all
      @communities = Community.all
      render 'admin_dashboard'
    elsif current_user.is? :Borrower
      if !params[:search].blank?
        @communities = []
        decode_search
      else
        if params[:sort]
          @communities = []
          decode_sort
        else
          @communities = Community.all
        end
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

  def zipcodes
    @zips = params["zipcodes"].map {|z| z.to_i}
    @all_zips = []
    @zips.each do |t|
      @all_zips << [t, 0]
    end
    @all_zips = @all_zips.to_h
    @communities = Community.all.reject { |c| !@all_zips.include?(c.address.zip) }
    render json: @communities
  end

  private
  def decode_search
    if params[:search] =~ /^\d{5}$/
      @addresses = Address.where(:zip => params[:search])
      @communities = []
      @addresses.each do |a|
        @communities << a.community
      end
    elsif params[:search] =~ /^\d.*\d$/
      @communities = Community.find_address(params[:search])
    else
      @communities = Community.where("name LIKE ?", "%#{params[:search]}%")
    end
  end

  def decode_sort
    if params[:sort] == "max_loan_amount"
      @communities = Community.order('max_loan_amount ASC')
    else
      @communities = Community.order('name ASC')
    end
  end

end
