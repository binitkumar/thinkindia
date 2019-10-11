class AddAcceptedToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :accepted, :boolean, default: false
    add_column :posts, :rejected, :boolean, default: false
  end
end
