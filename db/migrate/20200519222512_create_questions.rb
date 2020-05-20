class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :query
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.integer :correct_option
      t.integer :question_paper_id

      t.timestamps
    end
  end
end
