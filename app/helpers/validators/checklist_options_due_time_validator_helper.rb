# frozen_string_literal: true

module Validators
  module ChecklistOptionsDueTimeValidatorHelper
    CHECKLIST_NOT_PRESENT = I18n.t error.checklist_option.checklist.not_present
    DATE_NOT_PRESENT = I18n.t error.checklist_option.due_time.date.not_present
    DATE_TYPE_NOT_VALID = I18n.t error.checklist_option.due_time.date.type_not_valid

    def validate_checklist_presence
      option_due_time.errors[:base] << CHECKLIST_NOT_PRESENT unless option_due_time.checklist
    end

    def validate_date_presence
      option_due_time.errors[:base] << DATE_NOT_PRESENT unless option_due_time.date
    end

    def validate_date_type
      return unless option_due_time.date.class == ActiveSupport::TimeWithZone

      option_due_time.errors[:base] << DATE_TYPE_NOT_VALID
    end
  end
end
