class AddInternationalColumnToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :international, :boolean
  end
end
