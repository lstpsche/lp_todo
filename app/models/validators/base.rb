# frozen_string_literal: true

module Validators
  class Base < ActiveModel::Validator
    def validate(record)
      key = record.class.to_s.underscore

      validators[key].new(options[:fields]).validate(record)
    end

    private

    attr_reader :fields

    def validators
      {
        'checklist' => Validators::Checklists,
        'checklist_option' => Validators::ChecklistOptions,
        'checklist_option_due_time' => Validators::ChecklistOptionsDueTime,
        'due_time' => Validators::DueTime,
        'folder' => Validators::Folders,
        'label' => Validators::Labels,
        'note' => Validators::Notes,
        'ticket' => Validators::Tickets,
        'item' => Validators::Items,
        'workspace' => Validators::Workspaces
      }
    end
  end
end
