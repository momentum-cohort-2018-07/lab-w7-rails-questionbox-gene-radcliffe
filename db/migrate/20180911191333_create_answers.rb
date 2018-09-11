class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answerable_type
      t.integer :answerable_id
      t.integer :question_id

      t.timestamps
    end
  end
end
