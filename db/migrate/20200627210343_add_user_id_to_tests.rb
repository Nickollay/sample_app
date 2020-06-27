class AddUserIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :tests, on_delete: :cascade
  end
end
