class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_question, only: [:show, :update, :destroy, :edit]

  def index
    if params[:filter] == "All"
      @questions = Question.all.order("created_at DESC").order("created_at DESC")
      @title = "All Open Questions"
    elsif params[:filter]
      id_category = Category.where("name ILIKE ?", params[:filter]).first.id
      @questions = Question.where("category_id = ?", id_category).order("created_at DESC")
      @title = "All Questions in #{Category.find(id_category).name}"
    else
      @questions = Question.all.order("created_at DESC")
      @title = "All Open Questions"
    end
    @replies = Reply.all

    # trick to display an "All" category in the dropdown. Fake category is NOT saved.
    @categories = []
    @categories << Category.new(id:"0", name:"All")
    Category.all.each do |category|
    @categories << category
    end
  end

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
    @call = Call.new
    @replies = Reply.all
    # @user = @reply.user
    # @confirmedcalls = Call.where("call_status = ?", 1)
    # @existingcall = @confirmedcalls.where("reply_id = ?", @reply.id)
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

  private

  def question_params
    params.require(:question).permit(:category_id, :title, :description)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
