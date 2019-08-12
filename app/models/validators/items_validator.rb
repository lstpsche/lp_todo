# frozen_string_literal: true

module Validators
  class ItemsValidator < Base
    include ItemsValidatorHelper

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
  end
end
