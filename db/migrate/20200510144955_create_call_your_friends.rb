class CreateCallYourFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :call_your_friends do |t|
      t.string :your_name

      t.timestamps
    end
  end
end
