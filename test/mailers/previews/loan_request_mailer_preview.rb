class LoanRequestMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    LoanRequestMailer.send_email(User.last)
  end
end
