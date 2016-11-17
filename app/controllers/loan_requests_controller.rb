class LoanRequestsController < ApplicationController
  def create
    @loan = LoanRequest.new loan_params
    @loan.user_id = current_user.id
    if @loan.save
      LoanRequestMailer.send_email(Community.find(loan_params["community_id"]).user).deliver_now
      redirect_to dashboard_path
    else
      redirect_to :back
    end
  end
  def inbox
    @requests = LoanRequest.where(community_id: current_user.community.id, accepted: false)
  end
  def accept
    @request = LoanRequest.find(params[:id])
    @request.update_attributes(:accepted, true)
    redirect_to inbox_path
  end
  def reject
  end

  private
  def loan_params
    params.require(:loan_request).permit(:body, :community_id)
  end
end
