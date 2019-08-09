# frozen_string_literal: true

class CreateChecklistOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :checklist_options do |t|
      t.text :text, null: false
      t.boolean :checked, default: false, null: false
      t.references :checklist, foreign_key: true

      t.timestamps
    end
  end
end
