# frozen_string_literal: true

module Validators
  module ChecklistOptionsValidatorHelper
    CHECKED_FIELD_NOT_VALID = I18n.t error.checklist_option.checked_field.not_valid
    CHECKLIST_NOT_PRESENT = I18n.t error.checklist_option.checklist.not_present
    POSITION_NOT_PRESENT = I18n.t error.checklist_option.position.not_present
    POSITION_NOT_UNIQUE = I18n.t error.checklist_option.position.not_unique
    TEXT_NOT_PRESENT = I18n.t error.checklist_option.text.not_present

    def validate_checked_field
      option.errors[:base] << CHECKED_FIELD_NOT_VALID unless option.checked.in? [true, false]
    end

    def validate_checklist_presence
      option.errors[:base] << CHECKLIST_NOT_PRESENT unless option.checklist
    end

    def validate_position_presence
      option.errors[:base] << POSITION_NOT_PRESENT unless option.position
    end

    def validate_position_uniqueness(positions)
      option.errors[:base] << POSITION_NOT_UNIQUE if option.position.in? positions
    end

    def validate_text_presence
      option.errors[:base] << TEXT_NOT_PRESENT if option.text.blank?
    end
  end
end
