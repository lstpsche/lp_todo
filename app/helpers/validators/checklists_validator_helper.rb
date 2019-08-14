# frozen_string_literal: true

module Validators
  module ChecklistsValidatorHelper
    TITLE_NOT_PRESENT = 'Checklist should have a title. Please, specify one.'
    TICKET_NOT_PRESENT = 'Checklist should belong to ticket. Please, specify one.'

    def validate_title_presence
      list.errors[:base] << TITLE_NOT_PRESENT unless list.title.present?
    end

    def validate_ticket_presence
      list.errors[:base] << TICKET_NOT_PRESENT unless list.ticket
    end
  end
end
