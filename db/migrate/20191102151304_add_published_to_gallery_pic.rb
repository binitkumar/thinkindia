class AddPublishedToGalleryPic < ActiveRecord::Migration[5.2]
  def change
    add_column :gallery_pics, :published, :boolean, default: false
    add_column :gallery_pics, :private, :boolean, default: false
  end
end
