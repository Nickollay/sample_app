class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  has_many :created_tests, foreign_key: :creator_id, class_name: 'Test', dependent: :nullify

  def tests_participated_by_user(level)
  # TODO: where Devise'll be on board define user_id in method
    # id = current_user.id
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
        .where(tests: { level: level}, tests_users: { user_id: id } )
  end
end
