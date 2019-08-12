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
        send(field) if respond_to?(field, true)
      end
    end

    private

    attr_reader :fields, :ticket

    def title
      check_title_presence
    end

    def position_in_folder
      return unless (folder = ticket.folder)

      positions = folder.tickets.where.not(id: ticket.id).pluck(:position_in_folder)

      check_position_in_folder_uniqueness(positions)
      check_position_in_folder_presence
    end
  end
end
