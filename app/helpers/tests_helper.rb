module TestsHelper
  def isFilled?(test)
    test.questions.count > 0 && test.questions.all? { |question| question.answers.count > 0 }
  end
end
