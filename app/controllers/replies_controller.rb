class RepliesController < ApplicationController
  before_action :set_question, only: [:new, :show, :create, :edit, :accept, :reject]
  before_action :set_reply, only: [:show, :accept, :reject]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def create
    @reply = Reply.new(reply_params)
    @question = Question.find(params[:question_id])
    @reply.question = @question
    @reply.user = current_user
    @reply.reply_status = 0

    if @reply.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def new
    @reply = Reply.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
    @user = @reply.user
    @call = Call.new
    @confirmedcalls = Call.where("call_status = ?", 1)
    @existingcall = @confirmedcalls.where("reply_id = ?", @reply.id)
    @reviews = Review.all
  end

  private

  def reply_params
    params.require(:reply).permit(:offer, :description)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def respond_to_reply

  end
end
