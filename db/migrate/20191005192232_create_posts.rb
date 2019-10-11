class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :title
      t.text :content
      t.boolean :is_published
      t.boolean :is_moderated

      t.timestamps
    end
  end
end
