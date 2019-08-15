# frozen_string_literal: true

module Validators
  module ChecklistsValidatorHelper
    TICKET_NOT_PRESENT = I18n.t error.checklist.ticket.not_valid
    TITLE_NOT_PRESENT = I18n.t error.checklist.title.not_valid

    def validate_ticket_presence
      list.errors[:base] << TICKET_NOT_PRESENT unless list.ticket
    end

    def validate_title_presence
      list.errors[:base] << TITLE_NOT_PRESENT unless list.title.present?
    end
  end
end
