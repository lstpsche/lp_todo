# frozen_string_literal: true

module Validators
  module DueTimeValidatorHelper
    TICKET_NOT_PRESENT = I18n.t error.due_time.ticket.not_present
    DATE_NOT_PRESENT = I18n.t error.due_time.date.not_present
    DATE_TYPE_NOT_VALID = I18n.t error.due_time.date.type_not_valid

    def validate_ticket_presence
      due_time.errors[:base] << TICKET_NOT_PRESENT unless due_time.ticket
    end

    def validate_date_presence
      due_time.errors[:base] << DATE_NOT_PRESENT unless due_time.date
    end

    def validate_date_type
      due_time.errors[:base] << DATE_TYPE_NOT_VALID unless due_time.date.class == ActiveSupport::TimeWithZone
    end
  end
end
