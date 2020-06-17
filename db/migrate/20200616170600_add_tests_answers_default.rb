class AddTestsAnswersDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tests, :title, 'general')
    change_column_default(:tests, :level, 0)

    change_column_default(:answers, :is_correct, true)
  end
end
