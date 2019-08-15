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

    def checked
      validate_checked_field
    end

    def checklist
      validate_checklist_presence
    end

    def position
      return unless (checklist = options.checklist)

      validate_position_presence
      validate_position_uniqueness(checklist.options.pluck(:position))
    end

    def text
      validate_text_presence
    end
  end
end
