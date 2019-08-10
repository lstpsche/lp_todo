# frozen_string_literal: true

class Folder < ApplicationRecord
  has_many :ticket_folders, dependent: :destroy
  has_many :tickets, through: :ticket_folders
  has_one :item, as: :workspace_item, dependent: :destroy
end
