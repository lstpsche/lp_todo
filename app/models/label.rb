# frozen_string_literal: true

class Label < ApplicationRecord
  validates_with Validators::Base, fields: %i[title color]

  has_many :ticket_labels
  has_many :tickets, through: :ticket_labels
end
