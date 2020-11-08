class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])

    test_passage = current_user.test_passage(@test)

    redirect_to test_passage_path(test_passage)
  end

  def rescue_with_test_not_found
    redirect_to root_path
  end
end
