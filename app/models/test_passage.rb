class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question'

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  SUCCESS_RATE_LEVEL = 85

  def accept!(answer_ids)
    self.correct_questions_count += 1 if correct_answers.ids.sort == answer_ids.map(&:to_i).sort

    save
  end

  def completed?
    current_question.nil?
  end

  def result
    correct_questions_count
  end

  def test_result_rate
    (correct_questions_count.to_f / questions.size * 100).round
  end

  def test_progress
    ((current_question_serial_number.to_f - 1) / questions.size * 100).round
  end

  def success?
    test_result_rate >= SUCCESS_RATE_LEVEL
  end

  def current_question_serial_number
    questions.index(current_question) + 1
  end

  private

  def questions
    test.questions.order(:id)
  end

  def next_question
    questions.where('id > ?', current_question.id).first
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_first_question
    self.current_question = questions.first
  end

  def before_update_set_next_question
    self.current_question = next_question
  end
end
