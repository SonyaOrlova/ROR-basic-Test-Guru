class Test < ApplicationRecord
  belongs_to :category

  has_many :questions

  belongs_to :author, class_name: 'User'
  
  has_and_belongs_to_many :users

  def self.desc_tests_titles_by_category_title(category_title)
    Test.where(category_id: Category.where(title: category_title)).order(title: :desc).pluck(:title)
  end
end
