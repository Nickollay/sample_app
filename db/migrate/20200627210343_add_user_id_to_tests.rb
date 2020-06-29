class AddUserIdToTests < ActiveRecord::Migration[6.0]
  def change
    change_table :tests do |t|
      add_column :tests,  :creator_id, :bigint

      add_foreign_key :tests, :users, column: 'creator_id', on_delete: :cascade
    end
  end
end
