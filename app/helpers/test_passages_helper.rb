module TestPassagesHelper
  def result_text
    @test_passage.success? ? 'Тест пройден 😀' : 'Тест не пройден 😞'
  end
end
