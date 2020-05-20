class CreatePaperResults < ActiveRecord::Migration[5.2]
  def change
    create_table :paper_results do |t|
      t.integer :user_id
      t.integer :question_paper_id
      t.integer :correct_answer
      t.integer :wrong_answer

      t.timestamps
    end
  end
end
