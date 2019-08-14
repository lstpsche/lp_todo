# frozen_string_literal: true

module Validators
  module ChecklistOptionsDueTimeValidatorHelper
    DATE_NOT_PRESENT = 'Checklist options should have a due time. Please, specify one.'
    DATE_TYPE_NOT_VALID = 'Checklist options due time should be ActiveSupport::TimeWithZone.'
    CHECKLIST_NOT_PRESENT = 'Checklist options should have a checklist. Please, specify one.'

    def validate_date_presence
      option_due_time.errors[:base] << DATE_NOT_PRESENT unless option_due_time.date
    end

    def validate_date_type
      return unless option_due_time.date.class == ActiveSupport::TimeWithZone

      option_due_time.errors[:base] << DATE_TYPE_NOT_VALID
    end

    def validate_ticket_presence
      option_due_time.errors[:base] << CHECKLIST_NOT_PRESENT unless option_due_time.checklist
    end
  end
end
