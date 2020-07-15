class User < ApplicationRecord
  include Auth

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  has_many :test_passages
  has_many :passed_tests, through: :test_passages, source: :test

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    passed_tests << test

    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
