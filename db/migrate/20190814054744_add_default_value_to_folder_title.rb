# frozen_string_literal: true

class AddDefaultValueToFolderTitle < ActiveRecord::Migration[5.2]
  def change
    change_column :folders, :title, :string, default: '', null: false
  end
end
