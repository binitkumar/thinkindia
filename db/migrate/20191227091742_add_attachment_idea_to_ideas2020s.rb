class AddAttachmentIdeaToIdeas2020s < ActiveRecord::Migration[5.2]
  def self.up
    change_table :ideas2020s do |t|
      t.attachment :idea
    end
  end

  def self.down
    remove_attachment :ideas2020s, :idea
  end
end
