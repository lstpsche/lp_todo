# frozen_string_literal: true

class AddWorkspaceRefsToTicketsAndFolders < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :workspace, foreign_key: true
    add_reference :folders, :workspace, foreign_key: true
  end
end
