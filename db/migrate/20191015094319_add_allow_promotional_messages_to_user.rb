class AddAllowPromotionalMessagesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :allow_promotional_messages, :boolean, default: true
  end
end
