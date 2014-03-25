class ContactMailer < ActionMailer::Base
  default from: "from@example.com"
  def contact_email(message)
    @message = message
    mail(to: @message.email, subject: "New WCCC Gaming Contact Request")
  end
end
