# frozen_string_literal: true

module Validators
  class ItemsValidator < Base
    POSITION_ALREADY_TAKEN_MSG = 'This position is already taken. Please, specify another one.'

    def initialize(fields)
      @fields = fields
    end

    def validate(item)
      @item = item

      fields.each do |field|
        send(field) if respond_to?(field, true)
      end
    end

    private

    attr_reader :fields, :item

    def position
      return unless item.workspace

      positions = item.workspace.items.where.not(id: item.id).pluck(:position)
      check_position_uniqueness(positions)
    end

    def check_position_uniqueness(positions)
      item.errors[:base] << POSITION_ALREADY_TAKEN_MSG if positions.include?(item.position)
    end
  end
end
