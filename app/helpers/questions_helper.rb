module QuestionsHelper
  def question_header
    if @question.new_record?
      "Создание нового вопроса теста «#{@test.title}»"
     else
      "Редактирование вопроса теста «#{@question.test.title}»"
    end
  end
end
