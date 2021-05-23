class RemoveUrlAndAddHashIdToGists < ActiveRecord::Migration[6.0]
  def up
    add_column :gists, :hash_id, :string, null: false
    remove_column :gists, :url
  end

  def down
    add_column :gists, :url, :string, null: false
    remove_column :gists, :hash_id
  end
end
