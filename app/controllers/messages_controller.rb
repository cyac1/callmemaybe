class MessagesController < ApplicationController

  def create
    @message = Message.new
    @conversation = Conversation.find(params[:message][:conversation_id])
    @message.conversation = @conversation
    @message.sender = current_user
    @reply = Reply.find(params[:message][:reply_id])
    @message.receiver = @reply.user
    @message.content = params[:message][:content]
    @message.save!
    redirect_to conversation_path(@conversation, reply_id: @reply.id)
  end

end


