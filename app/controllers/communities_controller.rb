class CommunitiesController < ActionController::Base

    def show
      @community = Community.find(params[:id])
    end

    def edit
      @community = Community.find(params[:id])
    end

    def update
      @community = Community.find(params[:id])
      if @community.update_attributes community_params
        redirect_to root_path
      end
    end

    def new
      @community = Community.new
    end

    def create
      @community = Community.new community_params
      if @community.save
        redirect_to root_path
      end
    end

    def destroy
      @community = Community.find(params[:id])
      @community.destroy
      flash[:notice] = "#{@community.name} was successfully deleted."
      redirect_to root_path
    end

    private

    def community_params
      params.require(:community).permit(:name, :description, :total_loan_amount, :interest_rate, :terms, :max_loan_amount, :loan_period, :number, :email, :website, :user_id, images_attributes: [:location] )
    end
end
