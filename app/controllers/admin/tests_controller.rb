class Admin::TestsController < Admin::BaseController
  before_action :test, only: [:show, :destroy, :start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_tests_path, notice: t('.done', title: @test.title)
    else
      render :new
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path, notice: t('.done', title: @test.title)
  end

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

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
