# frozen_string_literal: true

class ChecklistOption < ApplicationRecord
  validates_with Validators::Base, fields: %i[checklist text checked]

  belongs_to :checklist
  has_one :due_time, class_name: 'ChecklistOptionDueTime', dependent: :destroy
end
