# frozen_string_literal: true

class Folder < ApplicationRecord
  has_many :ticket_folders
  has_many :tickets, through: :ticket_folders
end
