class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :roll_no, :string
    add_column :users, :batch_and_year, :string
    add_column :users, :aim_and_future_plan, :text
    add_column :users, :other_details, :text
  end
end
