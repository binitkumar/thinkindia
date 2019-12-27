class CreateIdeas2020s < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas2020s do |t|
      t.string :email
      t.string :name
      t.text :title

      t.timestamps
    end
  end
end
