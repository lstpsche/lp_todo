# frozen_string_literal: true

class DueTime < ApplicationRecord
  validates_with Validators::Base, fields: %i[date]

  belongs_to :ticket
end
