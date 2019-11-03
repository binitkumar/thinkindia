class CreateGalleryPics < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_pics do |t|
      t.integer :user_id
      t.string :pic_collection

      t.timestamps
    end
  end
end
