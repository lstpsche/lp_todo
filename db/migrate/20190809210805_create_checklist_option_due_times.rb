# frozen_string_literal: true

class CreateChecklistOptionDueTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :checklist_option_due_times do |t|
      t.datetime :date, default: Time.current, null: false
      t.references :checklist_option, foreign_key: true

      t.timestamps
    end
  end
end
