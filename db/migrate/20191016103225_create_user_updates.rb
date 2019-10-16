class CreateUserUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :user_updates do |t|
      t.integer :user_id
      t.string :level
      t.text :message

      t.timestamps
    end
  end
end
