class AddExtraColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hobbies, :string
    add_column :users, :interest_area, :text
    add_column :users, :hometown, :string
  end
end
