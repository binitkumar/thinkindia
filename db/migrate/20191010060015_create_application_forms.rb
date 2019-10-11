class CreateApplicationForms < ActiveRecord::Migration[5.2]
  def change
    create_table :application_forms do |t|
      t.string :name
      t.string :contact_no
      t.string :email
      t.text :message
      t.boolean :are_you_nit_rourkela_student

      t.timestamps
    end
  end
end
