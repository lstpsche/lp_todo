# frozen_string_literal: true

module Validators
  module ItemsValidatorHelper
    POSITION_ALREADY_TAKEN = I18n.t error.item.position.already_taken

    def validate_position_uniqueness(positions)
      item.errors[:base] << POSITION_ALREADY_TAKEN if positions.include?(item.position)
    end
  end
end
