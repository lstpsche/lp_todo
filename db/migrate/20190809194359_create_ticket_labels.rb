# frozen_string_literal: true

class CreateTicketLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_labels do |t|
      t.references :ticket, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps
    end
  end
end
