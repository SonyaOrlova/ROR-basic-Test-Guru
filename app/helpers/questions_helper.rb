module QuestionsHelper
  def question_header
    if @question.new_record?
      "Создание нового вопроса"
     else
      "Редактирование вопроса теста"
    end
  end
end
