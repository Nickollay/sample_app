class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show create destroy]

  rescue_from ActiveRecord::RecordNotFound,  with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.order(created_at: :asc).pluck(:body)
    render plain: @questions * "\n"
  end

  def show
    @question = Question.find(params[:id])
    render plain: @question.body
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to action: :show
    else
      render action: :new, flash: {alert: 'Some error occured.'}
    end
  end

  def destroy
    @test.question.destroy
    render plain: 'Question was deleted/'
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
