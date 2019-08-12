# frozen_string_literal: true

class Folder < ApplicationRecord
  has_many :ticket_folders, dependent: :destroy
  has_many :tickets, through: :ticket_folders
  belongs_to :workspace
end
