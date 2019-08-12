# frozen_string_literal: true

module Validators
  class TicketsValidator < Base
    POSITION_IN_FOLDER_ALREADY_TAKEN_MSG = 'This position is already taken. Please, specify another one.'
    POSITION_IN_FOLDER_NOT_PRESENT_MSG = 'Ticket should have a position in folder. Please, specify one.'

    def initialize(fields)
      @fields = fields
    end

    def validate(ticket)
      @ticket = ticket

      fields.each do |field|
        send(field) if respond_to?(field, true)
      end
    end

    private

    attr_reader :fields, :ticket

    def position_in_folder
      return unless (folder = ticket.folder)

      positions = folder.tickets.where.not(id: ticket.id).pluck(:position_in_folder)

      check_position_in_folder_uniqueness(positions)
      check_position_in_folder_presence
    end

    def check_position_in_folder_uniqueness(positions)
      ticket.errors[:base] << POSITION_IN_FOLDER_ALREADY_TAKEN_MSG if positions.include?(ticket.position_in_folder)
    end

    def check_position_in_folder_presence
      ticket.errors[:base] << POSITION_IN_FOLDER_NOT_PRESENT_MSG unless ticket.position_in_folder
    end
  end
end
