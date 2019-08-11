# frozen_string_literal: true

module Validators
  class ItemsValidator < Base
    def initialize(fields)
      @fields = fields
    end

    def validate(item)
      @item = item

      fields.each do |field|
        self.send(field) if self.respond_to?(field, true)
      end
    end

    private

    attr_reader :fields, :item

    def position
      positions = item.workspace.items.where.not(id: item.id).pluck(:position)

      if positions.include?(item.position)
        item.errors[:base] << "This position is already taken. Please, specify another one."
      end
    end
  end
end
