class CreateQuestionPapers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_papers do |t|
      t.string :title

      t.timestamps
    end
  end
end
