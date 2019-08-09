# frozen_string_literal: true

class TicketLabel < ApplicationRecord
  belongs_to :ticket, dependent: :destroy
  belongs_to :label, dependent: :destroy
end
