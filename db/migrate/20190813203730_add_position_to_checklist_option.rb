# frozen_string_literal: true

class AddPositionToChecklistOption < ActiveRecord::Migration[5.2]
  def change
    add_column :checklist_options, :position, :integer, null: false
  end
end
