class Test < ApplicationRecord
  belongs_to :category

  has_many :questions

  belongs_to :author, class_name: 'User'
  
  has_and_belongs_to_many :users

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_category_title, -> (category_title) { joins(:category).where(categories: { title: category_title }) }

  def self.desc_tests_titles_by_category_title(category_title)
    by_category_title(category_title).order(title: :desc).pluck(:title)
  end
end
