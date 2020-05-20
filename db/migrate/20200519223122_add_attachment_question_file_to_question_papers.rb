class AddAttachmentQuestionFileToQuestionPapers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :question_papers do |t|
      t.attachment :question_file
    end
  end

  def self.down
    remove_attachment :question_papers, :question_file
  end
end
