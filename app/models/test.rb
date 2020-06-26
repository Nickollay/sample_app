class Test < ApplicationRecord
  def self.test_titles_in_category(category)
    category_id = Category.where("title = ?", category).ids
    Test.where("tests.category_id = ?", category_id).order('title DESC').pluck(:title)
  end
end
