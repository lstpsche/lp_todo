class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title, default: '', null: false

      t.timestamps
    end
  end
end
