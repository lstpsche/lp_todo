# frozen_string_literal: true

module Validators
  class Base < ActiveModel::Validator
    def validate(record)
      key = record.class.to_s.underscore

      validators[key].validate(record) if validators[key]
    end

    private

    def validators
      {
        'ticket' => Validators::TicketsValidator.new(options[:fields])
      }
    end
  end
end