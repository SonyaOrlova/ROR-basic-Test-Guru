class Admin::TestsController < Admin::BaseController
  before_action :tests, only: [:index, :update_inline]
  before_action :test, only: [:edit, :destroy, :start, :update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

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

  def edit; end

  def destroy
    @test.destroy

    redirect_to admin_tests_path, notice: t('.done', title: @test.title)
  end

  def start
    test_passage = current_user.test_passage(@test)

    redirect_to test_passage_path(test_passage)
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('.done', title: @test.title)
    else
      render :index
    end
  end

  private

  def test
    @test = Test.find(params[:id])
  end

  def tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    redirect_to current_user.admin? ? admin_tests_path : root_path
  end
end
