class TestPassagesController < ApplicationController
  before_action :test_passage

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      response = result.response
      
      current_user.gists.create(question_id: @test_passage.current_question.id, gist_url: response.html_url)

      flash[:notice] = t('.success', gist_link: view_context.link_to(response.id, response.html_url, target: '_blank'))
    else
      flash[:alert] = t('.fail')
    end

    redirect_to @test_passage
  end

  private

  def test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
