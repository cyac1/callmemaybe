class CallsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :set_call, only: [:show, :update]

  def create
    @call = Call.new(call_params)
    @reply = Reply.find(params[:reply_id])
    @call.reply = @reply

    @question = Question.find(params[:question_id])
    @call.question = @question

    if @call.save
      redirect_to question_call_path(@question, @call)
    else
      redirect_to question_reply_path(@question, @reply)
    end
  end

  def show
    @reply = Reply.find(@call.reply_id)
    @question = Question.find(@call.question_id)
    @reviews = Review.where("call_id = ?", @call.id)
    @calls_of_replier = []
    Reply.where(user: @reply.user).each do |reply|
      @calls_of_replier << reply.call if reply.call.call_status == "confirmed"
    end
  end

  def edit
  end

  def update
    @question = Question.find(@call.question_id)
    date = params[:date]
    time = params[:time]
    newdate = DateTime.parse("#{params[:date]}-#{params[:time]}")

    @call.datetime = newdate
    if @call.save
      redirect_to question_call_path(@question, @call)
    else
      redirect_to question_call_path(@question, @call)
    end
  end

  def destroy
  end

  def confirm
    @call = Call.find(params[:call_id])
    @question = Question.find(@call.question_id)
    @call.call_status = "confirmed"
    if @call.save
      redirect_to question_call_path(@question, @call)
    else
      redirect_to question_call_path(@question, @call)
    end
  end

  private

  def call_params
    params.permit(:call_status, :price_cents, :datetime)
  end

  def set_call
    @call = Call.find(params[:id])
  end
end



