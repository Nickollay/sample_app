class User < ApplicationRecord
  def tests_participated_by_user(level)
  # TODO: where Devise'll be on board define user_id in method
    # id = current_user.id
    tests_ids = UserTest.where(user_id: id).pluck(:test_id)
    Test.where(id: tests_ids)
  end
end
