# frozen_string_literal: true

class ChecklistOptionDueTime < ApplicationRecord
  validates_with Validators::Base, fields: %i[date checklist]

  belongs_to :checklist_option
end
