class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.integer :phone_number
      t.string :company_name

      t.timestamps
    end
  end
end
