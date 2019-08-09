class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.string :title
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
