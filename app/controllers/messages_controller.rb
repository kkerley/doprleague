class MessagesController < ApplicationController
 
  # GET /message/new
  def new
    # @user = User.find(params[:user])
    @message = current_user.messages.new
  end
 
   # POST /message/create
  def create
    # @recipient = User.find_by_email(params[:recipient])
    @recipient = User.find(params[:recipient])
    current_user.send_message(@recipient, params[:body], params[:subject])
    flash[:notice] = "Message has been sent!"
    redirect_to :conversations
  end
end