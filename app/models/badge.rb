class Badge < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :test_passage, optional: true

  validates :title, :icon_url, :rule_type, :rule_value, presence: true

  RULES = {
    all_in_category: Category.pluck(:title),
    all_in_level: Test.pluck(:level).uniq,
    number_of_tries: [ 1 ]
  }.freeze
end
