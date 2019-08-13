# frozen_string_literal: true

module Validators
  module ChecklistOptionsValidatorHelper
    INVALID_OPTION_VALUE_MSG = 'Invalid checklist option value. It should be either checked or not checked.'
    TEXT_NOT_PRESENT_MSG = 'Checklist option should have a text. Please, specify one.'
    CHECKLIST_NOT_PRESENT_MSG = 'Checklist option should be in Checklist.'

    def validate_option_checklist_presence
      option.errors[:base] << CHECKLIST_NOT_PRESENT_MSG unless option.checklist
    end

    def validate_option_text_presence
      option.errors[:base] << TEXT_NOT_PRESENT_MSG if option.text.blank?
    end

    def validate_option_checked_field
      option.errors[:base] << INVALID_OPTION_VALUE_MSG unless option.checked.in? [true, false]
    end
  end
end
