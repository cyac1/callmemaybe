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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
                            # ID of Review  = ID of @call
                            # another way of writing but not good for security: ("call_id = @call.id")
    @reviews = Review.where("call_id = ?", @call.id)
    #coalla.com/calls/call_id/reviews/id
    #coalla.com/calls/2/reviews/1
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
