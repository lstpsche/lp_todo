# frozen_string_literal: true

module Validators
  module ItemsValidatorHelper
    POSITION_ALREADY_TAKEN_MSG = 'This position is already taken. Please, specify another one.'

    def check_position_uniqueness(positions)
      item.errors[:base] << POSITION_ALREADY_TAKEN_MSG if positions.include?(item.position)
    end
  end
end
