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
    Test.test_in_category(category).pluck(:title).uniq
    #Этот код работает в консоле, но если я меняю Test на test, с маленькой буквы
    # выдаёт ошибку:
    # irb(main):025:0> test.test_in_category('Front')
    # Traceback (most recent call last):
    #         2: from (irb):25
    #         1: from (irb):25:in `test'
    # ArgumentError (wrong number of arguments (given 0, expected 2..3))
    #
    # т.е. правильно все таки с большой?
    # а то в доках где-то видел с маленькой.
  end
end
