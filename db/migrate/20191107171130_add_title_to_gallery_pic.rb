class AddTitleToGalleryPic < ActiveRecord::Migration[5.2]
  def change
    add_column :gallery_pics, :title, :string, default: 'Click to add title to this pic..'
  end
end
