# frozen_string_literal: true

class AddPositionToWorkspaceItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :position, :integer, null: false
  end
end
