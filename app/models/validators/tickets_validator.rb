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
      folder = ticket.folder
      if folder
        positions = folder.tickets.where.not(id: ticket.id).pluck(:position_in_folder)

        if positions.include?(ticket.position_in_folder)
          ticket.errors[:base] << 'This position is already taken. Please, specify another one.'
        end

        if !ticket.position_in_folder
          ticket.errors[:base] << 'Ticket should have a position in folder. Please, specify one.'
        end
      end
    end
  end
end