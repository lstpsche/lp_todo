# frozen_string_literal: true

class Label < ApplicationRecord
  validates_with Validators::Base, fields: %i[color title]

  has_many :ticket_labels
  has_many :tickets, through: :ticket_labels
end
