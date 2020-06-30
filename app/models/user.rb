class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  has_many :created_tests, foreign_key: :creator_id, class_name: 'Test', dependent: :nullify

  def tests_participated_by_user(level)
    Test.where(level: level)
  end
end
