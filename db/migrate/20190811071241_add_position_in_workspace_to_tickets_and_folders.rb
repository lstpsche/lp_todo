class AddPositionInWorkspaceToTicketsAndFolders < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :position_in_workspace, :integer, default: nil, null: true
    add_column :folders, :position_in_workspace, :integer
  end
end
