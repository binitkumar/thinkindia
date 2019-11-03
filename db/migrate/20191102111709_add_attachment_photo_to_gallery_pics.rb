class AddAttachmentPhotoToGalleryPics < ActiveRecord::Migration[5.2]
  def self.up
    change_table :gallery_pics do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :gallery_pics, :photo
  end
end
