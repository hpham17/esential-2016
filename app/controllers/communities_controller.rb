class CommunitiesController < ActionController::Base
    def edit
        
    end

    def new
        
    end

    def create
        
    end

    def show
        @community = Community.find(params[:id])
        render 'communityDashboard'
    end
end