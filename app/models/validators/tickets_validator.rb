# frozen_string_literal: true

module Validators
  class TicketsValidator < Base
    include TicketsValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(ticket)
      @ticket = ticket

      fields.each do |field|
        send(field)
      end
    end

    private

    attr_reader :fields, :ticket

    def title
      check_title_presence
    end

    def position_in_folder
      return unless ticket.folder

      check_position_in_folder_uniqueness(in_folder_positions)
      check_position_in_folder_presence
    end

    def in_folder_positions
      @in_folder_positions ||= ticket.folder.tickets_positions(except: ticket.id)
    end
  end
end
