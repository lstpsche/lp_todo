# frozen_string_literal: true

class Ticket < ApplicationRecord
  validates :title, presence: true

  scope :oldest_first, -> { order(created_at: :asc) }
  scope :newest_first, -> { order(created_at: :desc) }
end
