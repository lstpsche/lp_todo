# frozen_string_literal: true

module Validators
  class Notes < Base
    include NotesValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(note)
      @note = note

      fields.each { |field| send(field) }
    end

    private

    attr_reader :fields, :note

    def text
      validate_text_presence
    end
  end
end
