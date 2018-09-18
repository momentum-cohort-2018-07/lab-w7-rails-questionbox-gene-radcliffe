class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :title
      t.text :body
      t.integer :answerable_id
      t.string :answerable_type
      t.integer :user_id

      t.timestamps
    end
  end
end
