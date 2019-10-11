class AddSlugToPressRelease < ActiveRecord::Migration[5.2]
  def change
    add_column :press_releases, :slug, :string
    add_index :press_releases, :slug, unique: true
  end
end
