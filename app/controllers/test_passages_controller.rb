class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
  def show
    # @current_question_number
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answers_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    current_question = @test_passage.current_question
    response = GistQuestionService.new(current_question).call
    html_url = response.html_url

    gist = Gist.new
    gist.user = current_user
    gist.question = current_question
    gist.url = html_url

    if success?(response) && gist.save
      flash[:success] = view_context.link_to( t('.success'), html_url)
    else
      flash[:error] = t('.failure')
    end

    redirect_to test_passage_path(@test_passage)
  end

  private
  def success?(response)
    response.html_url.present?
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
