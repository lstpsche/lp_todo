# frozen_string_literal: true

module Validators
  class Base < ActiveModel::Validator
    VALIDATORS = {
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
    }.freeze

    def validate(record)
      key = record.class.to_s.underscore

      validators[key].new(options[:fields]).validate(record)
    end
  end
end
