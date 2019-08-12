# frozen_string_literal: true

class CreateWorkspaces < ActiveRecord::Migration[5.2]
  def change
    create_table :workspaces do |t|
      t.string :title, null: true

      t.timestamps
    end
  end
end
