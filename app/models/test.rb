class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  
  has_many :users, through: :test_passages

  default_scope { order(:title) }

  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: [:level, :category_id] }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_create :capitalize_title

  # scope :easy, -> { where(level: 0..1) }
  # scope :medium, -> { where(level: 2..4) }
  # scope :hard, -> { where(level: 5..Float::INFINITY) }

  # scope :by_category_title, -> (category_title) { joins(:category).where(categories: { title: category_title }) }

  def capitalize_title
    self.title = title.split.map(&:capitalize).join(' ')
  end

  # def self.desc_tests_titles_by_category_title(category_title)
  #   by_category_title(category_title).order(title: :desc).pluck(:title)
  # end
end
