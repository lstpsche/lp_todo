# frozen_string_literal: true

class Folder < ApplicationRecord
  validates_with Validators::Base, fields: %i[title workspace]

  has_many :ticket_folders, dependent: :destroy
  has_many :tickets, through: :ticket_folders
  belongs_to :workspace

  def tickets_positions(except: nil)
    tickets.where.not(id: except).pluck(:position_in_folder)
  end
end
