class AddDotcomColumnToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :dotcom, :boolean
  end
end
