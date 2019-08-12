# frozen_string_literal: true

class CreateItemsForWorkspaces < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :workspace_item, polymorphic: true
      t.references :workspace, foreign_key: true

      t.timestamps
    end
  end
end
