class CreateOpenings < ActiveRecord::Migration[5.2]
  def change
    create_table :openings do |t|
      t.string :job_title
      t.text :job_description
      t.date :last_date
      t.boolean :is_open

      t.timestamps
    end
  end
end
