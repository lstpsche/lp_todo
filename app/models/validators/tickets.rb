# frozen_string_literal: true

module Validators
  class Tickets < Base
    include TicketsValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(ticket)
      @ticket = ticket

      fields.each { |field| send(field) }
    end

    private

    attr_reader :fields, :ticket

    def title
      validate_title_presence
    end

    def position_in_folder
      return unless ticket.folder

      validate_position_in_folder_uniqueness(in_folder_positions)
      validate_position_in_folder_presence
    end
  end
end
