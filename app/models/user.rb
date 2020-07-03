class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  has_many :created_tests, foreign_key: :creator_id, class_name: 'Test', dependent: :nullify

  validates :name, :email, :encrypted_password, presence: true

  def tests_participated_by_user(level)
    Test.where(level: level)
    # v3
    tests.where(tests: { level: level } )

    # for console:
    # User.where(id: 1).first.tests.where(tests: { level: 2 } )

    # v2
    # Test.joins(:tests_users)
    #     .where(tests: { level: level}, tests_users: { user_id: id } )

    # v1
    # Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
    #     .where(tests: { level: level}, tests_users: { user_id: id } )

  end
end
