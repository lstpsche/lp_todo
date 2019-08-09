class CreateChecklistOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :checklist_options do |t|
      t.text :text
      t.boolean :checked
      t.references :checklist, foreign_key: true

      t.timestamps
    end
  end
end
