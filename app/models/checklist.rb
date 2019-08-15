# frozen_string_literal: true

class Checklist < ApplicationRecord
  validates_with Validators::Base, fields: %i[ticket title]

  belongs_to :ticket
  has_one :content, as: :ticket_content, dependent: :destroy
  has_many :options, class_name: 'ChecklistOption', dependent: :destroy
end
