class CreatePressReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :press_releases do |t|
      t.text :title
      t.text :article

      t.timestamps
    end
  end
end
