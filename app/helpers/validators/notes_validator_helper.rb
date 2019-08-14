# frozen_string_literal: true

module Validators
  module NotesValidatorHelper
    TEXT_NOT_PRESENT_MSG = 'Note should have its text. Please, specify one.'

    def validate_text_presence
      note.errors[:base] << TEXT_NOT_PRESENT_MSG unless note.text
    end
  end
end
