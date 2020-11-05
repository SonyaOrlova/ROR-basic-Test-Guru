module TestPassagesHelper
  def result_text
    @test_passage.success? ? t('.success') : t('.fail')
  end
end
