# frozen_string_literal: true

class Note < ApplicationRecord
  validates_with Validators::Base, fields: %i[text]

  belongs_to :ticket
  has_one :content, as: :ticket_content, dependent: :destroy
end
