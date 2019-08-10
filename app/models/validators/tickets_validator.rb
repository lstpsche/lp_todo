# frozen_string_literal: true

module Validators
  class TicketsValidator < Base
    def initialize(fields)
      @fields = fields
    end

    def validate(ticket)
      @ticket = ticket

      fields.each do |field|
        self.send(field) if self.respond_to?(field, true)
      end
    end

    private

    attr_reader :fields, :ticket

    def position_in_folder
      if ticket.ticket_folder
        positions = ticket.folder.tickets.where.not(id: ticket.id).pluck(:position_in_folder)

        if positions.include?(ticket.position_in_folder)
          ticket.errors[:base] << "This position is already taken. Please, specify another one."
        end
      end
    end
  end
end