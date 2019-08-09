class Label < ApplicationRecord
  has_many :ticket_labels
  has_many :tickets, through: :ticket_labels
end
