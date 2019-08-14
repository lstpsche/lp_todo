# frozen_string_literal: true

module Validators
  class Labels < Base
    include LabelsValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(label)
      @label = label

      fields.each { |field| send(field) }
    end

    private

    attr_reader :fields, :label

    def title
      validate_title_presence
    end

    def color
      # this method sets color to white (#000000) if it's nil
      validate_color_presence
      validate_color_value
    end
  end
end
