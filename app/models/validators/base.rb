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
        'checklist_option' => Validators::ChecklistOptions.new(fields),
        'due_time' => Validators::DueTime.new(fields),
        'folder' => Validators::Folders.new(fields),
        'label' => Validators::Labels.new(fields),
        'note' => Validators::Notes.new(fields),
        'ticket' => Validators::Tickets.new(fields),
        'item' => Validators::Items.new(fields),
        'workspace' => Validators::Workspaces.new(fields)
      }
    end
  end
end
