# frozen_string_literal: true

module Validators
  class DueTime < Base
    include DueTimeValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(due_time)
      @due_time = due_time

      fields.each { |field| send(field) }
    end

    private

    attr_reader :fields, :due_time

    def date
      validate_date_presence
      validate_date_type
    end
  end
end
