class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_question, only: [:show, :update, :destroy, :edit]

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def new
    @question = Question.new
  end

  def show
    @reviews = Review.all
  end

  def edit
    # User that clicks has to be user that created question
    if @question.user.id == current_user.id
    # go to edit view
    else
      redirect_to question_path(@question)
    end
  end

  def update
   if @question.user.id == current_user.id
      @question.update(question_params)
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question)
    end
  end

  def destroy
    if @question.user.id == current_user.id
      @question.destroy
      redirect_to questions_path
    else
      redirect_to question_path(@question)
    end
  end

  def index
    @questions = Question.all.order("created_at DESC")
    @replies = Reply.all
  end

  private

  def question_params
    params.require(:question).permit(:category_id, :title, :description)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
