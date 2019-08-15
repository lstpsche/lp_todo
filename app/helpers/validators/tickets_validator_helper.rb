# frozen_string_literal: true

module Validators
  module TicketsValidatorHelper
    POSITION_IN_FOLDER_ALREADY_TAKEN = I18n.t error.ticket.position_in_folder.already_taken
    POSITION_IN_FOLDER_NOT_PRESENT = I18n.t error.ticket.position_in_folder.not_present
    TITLE_NOT_PRESENT = I18n.t error.ticket.title.not_present

    def in_folder_positions
      @in_folder_positions ||= ticket.folder.tickets_positions(except: ticket.id)
    end

    def validate_position_in_folder_presence
      ticket.errors[:base] << POSITION_IN_FOLDER_NOT_PRESENT unless ticket.position_in_folder
    end

    def validate_position_in_folder_uniqueness(positions)
      ticket.errors[:base] << POSITION_IN_FOLDER_ALREADY_TAKEN if positions.include?(ticket.position_in_folder)
    end

    def validate_title_presence
      ticket.errors[:base] << TITLE_NOT_PRESENT unless ticket.title
    end
  end
end
