class User < ApplicationRecord
  def tests_participated_by_user(level)
  # TODO: where Devise'll be on board define user_id in method
    # id = current_user.id
    tests_ids = UserTest.where(user_id: id).pluck(:test_id)
    Test.where(id: tests_ids)


    # Создайте инстанс-метод в модели User, который
    # принимает
    # в качестве аргумента значение уровня сложности и возвращает
    # список всех Тестов, которые проходит
    # или когда-либо проходил Пользователь на этом уровне сложности
    Test.joins(:tests_users)
  end
end
