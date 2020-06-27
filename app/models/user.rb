class User < ApplicationRecord

  has_many :user_test_associations
  has_many :tests, through: :user_test_associations

  has_many :tests
  has_many :questions

  def tests_participated_by_user(level)
  # TODO: where Devise'll be on board define user_id in method
    # id = current_user.id
    tests_ids = UserTestAssociation.where(user_id: id).pluck(:test_id)
    Test.where(id: tests_ids)
  end
end
