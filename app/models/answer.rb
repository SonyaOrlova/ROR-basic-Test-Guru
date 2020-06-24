class Answer < ApplicationRecord
  MAX_ANSWERS_COUNT = 4

  belongs_to :question

  scope :correct, -> { where(is_correct: true) }

  validates :body, presence: true
  validate :validate_answers_count

  private

  def validate_answers_count
    errors.add(:question) if question.answers.count >= MAX_ANSWERS_COUNT
  end
end
