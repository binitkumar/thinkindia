class CreateCalledFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :called_friends do |t|
      t.string :name
      t.bigint :contact_no
      t.bigint :whatsapp_no
      t.string :institution
      t.string :department
      t.integer :call_your_friend_id

      t.timestamps
    end
  end
end
