# frozen_string_literal: true

module Validators
  module LabelsValidatorHelper
    TITLE_NOT_PRESENT_MSG = 'Label should have its title. Please, specify one.'
    COLOR_VALUE_NOT_VALID = 'Label color should be in hex format.'
    COLOR_PATTERN_REGEX = /^#([a-f0-9]{6}|[a-f0-9]{3})$/.freeze

    def validate_title_presence
      label.errors[:base] << TITLE_NOT_PRESENT_MSG unless label.title
    end

    def validate_color_presence
      label.color ||= '#000000'
    end

    def validate_color_value
      label.errors[:base] << COLOR_VALUE_NOT_VALID unless COLOR_PATTERN_REGEX.match?(label.color)
    end
  end
end
