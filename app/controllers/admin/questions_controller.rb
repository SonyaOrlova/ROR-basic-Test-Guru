class Admin::QuestionsController < Admin::BaseController
  before_action :test, only: [:new, :create]
  before_action :question, only: [:edit, :update, :destroy]

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to edit_admin_test_path(@test), notice: t('.done', test: @question.test.title, question: @question.body)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to edit_admin_test_path(@question.test), notice: t('.done', test: @question.test.title, question: @question.body)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    
    redirect_to edit_admin_test_path(@question.test), notice: t('.done', test: @question.test.title, question: @question.body)
  end

  private

  def question
    @question = Question.find(params[:id]) if params[:id]
  end

  def test
    @test = Test.find(params[:test_id]) if params[:test_id]
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
