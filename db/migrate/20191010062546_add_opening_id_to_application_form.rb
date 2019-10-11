class AddOpeningIdToApplicationForm < ActiveRecord::Migration[5.2]
  def change
    add_column :application_forms, :opening_id, :integer
  end
end
