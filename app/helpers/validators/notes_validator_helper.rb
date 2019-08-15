# frozen_string_literal: true

module Validators
  module NotesValidatorHelper
    TEXT_NOT_PRESENT = I18n.error.note.text.not_present

    def validate_text_presence
      note.errors[:base] << TEXT_NOT_PRESENT unless note.text
    end
  end
end
