# frozen_string_literal: true

module Validators
  class Base < ActiveModel::Validator
    def validate(record)
      key = record.class.to_s.underscore
      fields = options[:fields]

      validators[key].validate(record)
    end

    private

    def validators
      {
        'ticket' => Validators::TicketsValidator.new(fields),
        'item' => Validators::ItemsValidator.new(fields)
      }
    end
  end
end
