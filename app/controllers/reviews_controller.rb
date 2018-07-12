class ReviewsController < ApplicationController
  before_action :set_call, only: [:new, :create, :show]
  before_action :set_review, only: []

  def create
    @review = Review.new(review_params)
    @question = Question.find(@call.question_id)
    #add user to review
    @user = current_user
    @review.user = @user
    #add call to review
    @review.call = @call

    if @review.save
      redirect_to question_call_path(@question, @call)
    else
      render :new
    end
  end

  def new
    @review = Review.new

    # Find user to display him in review form
    @reply = Reply.where("id = ?", @call.reply_id)
    @user = User.where("id = ?", @reply[0].user_id)[0]

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @reviews = Review.where("call_id = ?", @call.id)
  end

  private
  def set_call
    @call = Call.find(params[:call_id])
  end

  def set_review
    @review = Review.find(params[:review_id])
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
