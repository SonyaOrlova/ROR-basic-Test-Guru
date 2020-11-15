class TestPassagesController < ApplicationController
  before_action :test_passage

  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.timer_expired? || @test_passage.passed
  end

  def update
    unless params[:answer_ids].present?
      redirect_to test_passage_path(@test_passage), notice: t('.no_answer_given')
      
      return
    end

    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.update(passed: true) if @test_passage.success?

      TestsMailer.completed_test(@test_passage).deliver_now

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end

  end

  def result
    BadgeService.new(@test_passage).getBadges

    @badges = test_passage.badges
  end

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
