# frozen_string_literal: true

module Validators
  class Base < ActiveModel::Validator
    def validate(record)
      key = record.class.to_s.underscore
      @fields = options[:fields]

      validators[key].validate(record)
    end

    private

    attr_reader :fields

    def validators
      {
        'checklist_option' => ChecklistOptions.new(fields),
        'folder' => Folders.new(fields),
        'label' => Labels.new(fields),
        'note' => Notes.new(fields),
        'ticket' => Tickets.new(fields),
        'item' => Items.new(fields),
        'workspace' => Workspaces.new(fields)
      }
    end
  end
end
