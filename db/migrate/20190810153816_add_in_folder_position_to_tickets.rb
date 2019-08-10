class AddInFolderPositionToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :position_in_folder, :integer, default: nil, null: true
  end
end
