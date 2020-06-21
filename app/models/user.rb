class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  has_and_belongs_to_many :passed_tests, class_name: 'Test', foreign_key: 'test_id'

  def tests_by_level(level)
    tests.where(level: level)
  end
end
