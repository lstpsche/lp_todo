# frozen_string_literal: true

class CreateContentsForTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :ticket_content, polymorphic: true
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
