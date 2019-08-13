# frozen_string_literal: true

module Validators
  class Items < Base
    include ItemsValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(item)
      @item = item

      fields.each { |field| send(field) }
    end

    private

    attr_reader :fields, :item

    def position
      return unless (space = item.workspace)

      positions = space.items.where.not(id: item.id).pluck(:position)
      check_position_uniqueness(positions)
    end
  end
end
