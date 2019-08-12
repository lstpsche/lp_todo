# frozen_string_literal: true

module Validators
  module TicketsValidatorHelper
    TITLE_NOT_PRESENT_MSG = 'Ticket should have a title. Please, specify one.'
    POSITION_IN_FOLDER_ALREADY_TAKEN_MSG = 'This position is already taken. Please, specify another one.'
    POSITION_IN_FOLDER_NOT_PRESENT_MSG = 'Ticket should have a position in folder. Please, specify one.'

    def check_title_presence
      ticket.errors[:base] << TITLE_NOT_PRESENT_MSG unless ticket.title
    end

    def check_position_in_folder_uniqueness(positions)
      ticket.errors[:base] << POSITION_IN_FOLDER_ALREADY_TAKEN_MSG if positions.include?(ticket.position_in_folder)
    end

    def check_position_in_folder_presence
      ticket.errors[:base] << POSITION_IN_FOLDER_NOT_PRESENT_MSG unless ticket.position_in_folder
    end
  end
end
