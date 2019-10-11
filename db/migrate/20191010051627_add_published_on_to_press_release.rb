class AddPublishedOnToPressRelease < ActiveRecord::Migration[5.2]
  def change
    add_column :press_releases, :published_on, :date
  end
end
