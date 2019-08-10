class CreateTicketFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_folders do |t|
      t.references :ticket, foreign_key: true
      t.references :folder, foreign_key: true

      t.timestamps
    end
  end
end
