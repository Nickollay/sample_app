class User < ApplicationRecord

  has_many :tests_users
  has_many :tests, through: :tests_users

  has_many :answers_users
  has_many :answers, through: :answers_users

  has_many :tests
  # has_many :questions

  def tests_participated_by_user(level)
  # TODO: where Devise'll be on board define user_id in method
    # id = current_user.id
    tests_ids = TestsUser.where(user_id: id).pluck(:test_id)
    Test.where(id: tests_ids)
  end
end
