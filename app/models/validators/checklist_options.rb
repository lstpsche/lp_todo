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
      check_text_presence
    end

    def checklist
      check_checklist_presence
    end

    def checked
      check_checked_field
    end

    def position
      return unless (checklist = options.checklist)

      check_position_presence
      check_position_uniqueness(checklist.options.pluck(:position))
    end
  end
end
