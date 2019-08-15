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

    def position_in_folder
      return unless ticket.folder

      validate_position_in_folder_presence
      validate_position_in_folder_uniqueness(in_folder_positions)
    end

    def title
      validate_title_presence
    end
  end
end
