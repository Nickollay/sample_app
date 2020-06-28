class Test < ApplicationRecord
  def self.test_titles_in_category(category)
    category_id = Category.where("title = ?", category).ids
    Test.where("tests.category_id = ?", category_id).order('title DESC').pluck(:title)

    # Создайте метод класса в модели Test, который возвращает
    # отсортированный по убыванию массив названий всех Тестов
    # у которых Категория называется определённым образом
    # (название категории передается в метод в качестве аргумента).
    #     end
    Test.joins('JOIN categories ON test.category_id = category.id').where(category: { title: 'Front' } ).order(title: :desc).pluck(:title)
    # Test.joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category } ).select(:title).order(title: :desc)
  end
end
