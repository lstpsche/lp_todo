# frozen_string_literal: true

module Validators
  class ChecklistOptions < Base
    include ChecklistOptionsDueTimeValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(option_due_time)
      @option_due_time = option_due_time

      fields.each { |field| send(field) }
    end

    private

    attr_reader :fields, :option_due_time

    def date
      validate_date_presence
      validate_date_type
    end

    def checklist
      validate_checklist_presence
    end
  end
end
