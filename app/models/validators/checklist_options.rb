# frozen_string_literal: true

module Validators
  class ChecklistOptions < Base
    include ChecklistOptionsValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(option)
      @option = option

      fields.each { |field| send(field) }
    end

    private

    attr_reader :fields, :option

    def text
      validate_option_text_presence
    end

    def checklist
      validate_option_checklist_presence
    end

    def checked
      validate_option_checked_field
    end
  end
end
