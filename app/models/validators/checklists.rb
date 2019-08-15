# frozen_string_literal: true

module Validators
  class Checklists < Base
    include ChecklistsValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(list)
      @list = list

      fields.each { |field| send(field) }
    end

    private

    attr_reader :fields, :list

    def title
      validate_title_presence
    end

    def ticket
      validate_ticket_presence
    end
  end
end
