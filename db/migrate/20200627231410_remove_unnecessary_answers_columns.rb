class RemoveUnnecessaryAnswersColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :correct
    remove_column :answers, :user_id
  end
end
