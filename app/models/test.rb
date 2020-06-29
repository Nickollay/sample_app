class Test < ApplicationRecord
  def self.test_titles_in_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: category } )
        .order(title: :desc).pluck(:title).uniq
  end
end
