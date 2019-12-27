class DefaultApprovalUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :is_active, :boolean, default: true
  end
end
