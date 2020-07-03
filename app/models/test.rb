class Test < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User', optional: true
  belongs_to :category, optional: true

  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  has_many :questions, dependent: :destroy

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :test_in_category, -> (category) { joins(:category)
                                               .where(categories: { title: category } )
                                               .order(title: :desc) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.test_titles_in_category(category)
    # v3
    test_in_category(category).pluck(:title).uniq

    # v2
    # Test.joins(:category)
    #     .where(categories: { title: category } )
    #     .order(title: :desc).pluck(:title).uniq

    # v1
    # Test.joins('JOIN categories ON tests.category_id = categories.id')
    #     .where(categories: { title: category } )
    #     .order(title: :desc).pluck(:title).uniq
  end
end
