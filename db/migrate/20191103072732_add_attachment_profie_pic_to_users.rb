class AddAttachmentProfiePicToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :users, :profile_pic
  end
end
