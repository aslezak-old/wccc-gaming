class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      ContactMailer.contact_email(@message).deliver
      redirect_to root_path, notice: "Message sent! Thank you for contacting us!"
    else
      render "new"
    end
  end
end
