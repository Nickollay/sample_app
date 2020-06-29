class User < ApplicationRecord
  def tests_participated_by_user(level)
  # TODO: where Devise'll be on board define user_id in method
    # id = current_user.id
  # TODO: after merging ex_5 change on that:
  #  Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
  #         .where(tests: { level: 1}, tests_users: { user_id: 2 } )
    Test.joins('JOIN user_tests ON tests.id = user_tests.test_id')
        .where(tests: { level: level}, user_tests: { user_id: id } )
  end
end
