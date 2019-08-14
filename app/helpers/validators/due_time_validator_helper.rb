# frozen_string_literal: true

module Validators
  module DueTimeValidatorHelper
    DATE_NOT_PRESENT = 'Due time should have a date. Please, specify one.'
    DATE_TYPE_NOT_VALID = 'Due time date should be ActiveSupport::TimeWithZone.'
    TICKET_NOT_PRESENT = 'Due time should have a ticket. Please, specify one.'

    def validate_date_presence
      due_time.errors[:base] << DATE_NOT_PRESENT unless due_time.date
    end

    def validate_date_type
      due_time.errors[:base] << DATE_TYPE_NOT_VALID unless due_time.date.class == ActiveSupport::TimeWithZone
    end

    def validate_ticket_presence
      due_time.errors[:base] << TICKET_NOT_PRESENT unless due_time.ticket
    end
  end
end
