class Test < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User', optional: true
  belongs_to :category, optional: true

  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  has_many :questions, dependent: :destroy

  def self.test_titles_in_category(category)
    Test.joins(:category)
        .where(categories: { title: category } )
        .order(title: :desc).pluck(:title).uniq
  end
end
