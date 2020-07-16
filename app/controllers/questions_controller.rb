class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound,  with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.order(created_at: :asc).pluck(:body)
    render plain: @questions * "\n"
  end

  def show
    @question = @test.questions.find(params[:id])
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render :show
    else
      render :new
    end
  end

  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy
    render plain: 'Question was deleted!'
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
end
