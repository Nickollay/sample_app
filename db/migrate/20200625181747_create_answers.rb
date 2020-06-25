class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :correct, :default => 0, :null => false
      t.reference :question, foreign_key: true
      t.reference :user, foreign_key: true

      t.timestamps
    end
  end
end
