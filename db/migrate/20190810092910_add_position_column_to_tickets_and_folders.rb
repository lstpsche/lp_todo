class AddPositionColumnToTicketsAndFolders < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :position, :integer, null: false
    add_column :folders, :position, :integer, null: false
  end
end
