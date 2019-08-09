# frozen_string_literal: true

class ChecklistOption < ApplicationRecord
  belongs_to :checklist
  has_one :due_time, class_name: 'ChecklistOptionDueTime', dependent: :destroy
end
