class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations
  end

  def create

    @conversation = Conversation.new
    if params[:reply_id].nil?
    else
      @reply = Reply.find(params[:reply_id])

    end

    if params[:question_id].nil?
      @question = @reply.question
    else
      @question = Question.find(params[:question_id])
    end

    @conversation.offer = @reply.offer
    @conversation.question = @question

    current_user.conversations.each do |c|
      @other_user = c.messages.first.receiver
      if @other_user == @reply.user
        @conversation = c
      end
    end

    @conversation.save!
    redirect_to conversation_path(@conversation, request.parameters)
  end

  def update
    @conversation = Conversation.find(params[:id])
    @conversation.offer = params[:conversation]["offer"]
    @conversation.save
    @reply_id = params[:conversation][:reply_id]
    redirect_to conversation_path(@conversation, reply_id: @reply_id)
  end

  def show
    @message = Message.new
    @conversation = Conversation.find(params[:id])
    @question = @conversation.question
    @reply = Reply.find(params[:reply_id])
    @receiver = @reply.user
  end

  private

  def conversation_params
    params.permit(:offer)
    # params.require(:question).permit(:user_id, :title)
    # params.require(:reply).permit(:user_id, :offer)
  end

  def offer
    @message = Message.new
    @message.message_type = 1
    @message.content = "You sent a new offer"
  end

  # def self.other_user
  #   message = current_user.conversations.last.messages.last
  #   if message.sender == current_user
  #     @other_user = message.receiver
  #   else
  #     @other_user = message.sender
  # end

end
