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

  private

  def test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
