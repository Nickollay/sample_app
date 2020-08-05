class QuestionsController < ApplicationController
  before_action :find_test, except: [:show, :edit, :update, :destroy]
  before_action :find_question, only: [:show, :destroy, :edit, :update]


  def index
    @questions = @test.questions.order(created_at: :asc).pluck(:body)
  end

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.save
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
