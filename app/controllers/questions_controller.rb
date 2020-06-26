class QuestionsController < ApplicationController
  before_action :test, only: [:index, :create]
  before_action :question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def show; end

  def new; end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render plain: 'Вопрос успешно создан'
    else
      render plain: 'Ошибка создания вопроса'
    end
  end

  def destroy
    @question.delete
    
    render plain: 'Вопрос успешно удален'
  end

  private

  def test
    @test = Test.find(params[:test_id])
  end

  def question
    @question = Question.find(params[:id])
  end

  def question_params
    params.permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
