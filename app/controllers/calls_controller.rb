class CallsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :set_call, only: [:show, :update]

  def index
    calls = current_user.calls #.where("call.datetime > ?", Time.current)
    @question_calls = calls.select { |c| c.question_author == current_user }
    @reply_calls = calls.select { |c| c.reply_author == current_user }
  end

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

    # (1) Find user that gave the reply to this call
    replying_user = @reply.user

    #(2) Find all his replies until today
    repliers_replies = Reply.where("user_id = ?", replying_user.id)

    #(3) Knowing the ID of all his replies, find corresponding calls
    @calls_of_replier = []
    repliers_replies.each do |reply|
      if !reply.call.nil? && reply.call.call_status == "confirmed"
        @calls_of_replier << Call.where("reply_id = ?", reply.id).first
      end
    end
    #(4) calls_of_replier Array now holds all calls of user that gave reply
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



