class RenameTestUsersToTestUserAssociations < ActiveRecord::Migration[6.0]
  def change
    rename_table :user_tests, :user_test_association
  end
end
