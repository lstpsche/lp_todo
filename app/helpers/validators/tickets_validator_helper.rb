# frozen_string_literal: true

module Validators
  module TicketsValidatorHelper
    TITLE_NOT_PRESENT_MSG = 'Ticket should have a title. Please, specify one.'
    POSITION_IN_FOLDER_ALREADY_TAKEN_MSG = 'This position is already taken. Please, specify another one.'
    POSITION_IN_FOLDER_NOT_PRESENT_MSG = 'Ticket should have a position in folder. Please, specify one.'

    def validate_title_presence
      ticket.errors[:base] << TITLE_NOT_PRESENT_MSG unless ticket.title
    end

    def validate_position_in_folder_uniqueness(positions)
      ticket.errors[:base] << POSITION_IN_FOLDER_ALREADY_TAKEN_MSG if positions.include?(ticket.position_in_folder)
    end

    def validate_position_in_folder_presence
      ticket.errors[:base] << POSITION_IN_FOLDER_NOT_PRESENT_MSG unless ticket.position_in_folder
    end

    def in_folder_positions
      @in_folder_positions ||= ticket.folder.tickets_positions(except: ticket.id)
    end
  end
end
