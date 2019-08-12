# frozen_string_literal: true

class AddFolderRefToTicket < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :folder, foreign_key: true
  end
end
