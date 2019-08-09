# frozen_string_literal: true

class Ticket < ApplicationRecord
  validates :title, presence: true

  has_many :notes, dependent: :destroy
  has_many :contents, dependent: :destroy

  scope :oldest_first, -> { order(created_at: :asc) }
  scope :newest_first, -> { order(created_at: :desc) }
end
