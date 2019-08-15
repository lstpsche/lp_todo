# frozen_string_literal: true

module Validators
  module LabelsValidatorHelper
    COLOR_PATTERN_REGEX = /^#([a-f0-9]{6}|[a-f0-9]{3})$/.freeze
    COLOR_VALUE_NOT_VALID = I18n.t error.label.color.not_valid
    TITLE_NOT_PRESENT = I18n.t error.label.title.not_present

    def validate_color_presence
      label.color ||= '#000000'
    end

    def validate_color_value
      label.errors[:base] << COLOR_VALUE_NOT_VALID unless COLOR_PATTERN_REGEX.match?(label.color)
    end

    def validate_title_presence
      label.errors[:base] << TITLE_NOT_PRESENT unless label.title
    end
  end
end
