# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :text, null: false
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
