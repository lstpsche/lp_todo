# frozen_string_literal: true

class TicketFolder < ApplicationRecord
  belongs_to :ticket
  belongs_to :folder
end
