class CreateDueTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :due_times do |t|
      t.datetime :date
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
