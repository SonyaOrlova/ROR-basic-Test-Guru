class Admin::AnswersController < Admin::BaseController
  before_action :answer, :question

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_test_path(@question.test), notice: "Ответ «#{@answer.body}» для вопроса «#{@question.body}» был успешно создан"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to admin_test_path(@answer.question.test), notice: "Ответ «#{@answer.body}» для вопроса «#{@answer.question.body}» был успешно изменен"
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    
    redirect_to admin_test_path(@answer.question.test), notice: "Ответ «#{@answer.body}» для вопроса «#{@answer.question.body}» был успешно удален"
  end

  private

  def answer
    @answer = Answer.find(params[:id]) if params[:id]
  end

  def question
    @question = Question.find(params[:question_id]) if params[:question_id]
  end

  def answer_params
    params.require(:answer).permit(:body, :is_correct)
  end
end
