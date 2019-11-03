class CreateGalleryPicComments < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_pic_comments do |t|
      t.integer :gallery_pic_id
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
