class CreateAnswersUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers_users do |t|
      t.references :answer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :correct, default: false, null: false

      t.timestamps
    end
  end
end
