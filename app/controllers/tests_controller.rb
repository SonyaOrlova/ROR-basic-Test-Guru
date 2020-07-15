class TestsController < ApplicationController
  before_action :test, only: [:show, :start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def start
    test_passage = current_user.test_passage(@test)

    redirect_to test_passage_path(test_passage)
  end

  def rescue_with_test_not_found
    redirect_to root_path
  end

  private

  def test
    @test = Test.find(params[:id])
  end
end
