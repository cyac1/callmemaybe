class CallsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :set_call, only: [:show, :update]

  def index
    calls = Call.all #current_user.calls #.where("call.datetime > ?", Time.current)
    @question_calls = calls.select { |c| (c.question_author == current_user) && c.call_status == "confirmed"}
    @reply_calls = calls.select { |c| (c.reply_author == current_user) && c.call_status == "confirmed"}
  end

  def create
    @reply = Reply.find(params[:reply_id])
    all_calls = Call.where("reply_id = ?", @reply.id)

    # Checkout whether this reply has a call already
    # If no call exists, create one
    if all_calls.empty?
      @call = Call.new(call_params)
      @call.reply = @reply
      @question = Question.find(params[:question_id])
      @call.question = @question

      if @call.save
        redirect_to question_call_path(@question, @call)
      else
        redirect_to question_reply_path(@question, @reply)
      end
    # If Call exists, do not create new one but redirect to existing one
    else
      ### IMPORTANT ###
      # Last is a placeholder here, we have to fix our database,
      # so there is always only ONE CALL per Reply
      @call = all_calls.last
      @question = Question.find(params[:question_id])
      redirect_to question_call_path(@question, @call)
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



