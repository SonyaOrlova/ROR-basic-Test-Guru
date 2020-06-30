class QuestionsController < ApplicationController
  before_action :question, :test

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_path(@test), notice: "Вопрос «#{@question.body}» был успешно создан"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test), notice: "Вопрос «#{@question.body}» был успешно изменен"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    
    redirect_to test_path(@question.test), notice: "Вопрос «#{@question.body}» был успешно удален"
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
