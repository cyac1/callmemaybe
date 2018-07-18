class ConversationsController < ApplicationController

  def create
    @conversation = Conversation.new(conversation_params)
    if params[:question_id].nil?
    else
      @question = Question.find(params[:question_id])
      @conversation.question = @question
    end

    if params[:reply_id].nil?
    else
      @reply = Reply.find(params[:reply_id])
      @conversation.offer = @reply.offer
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

  end

end
