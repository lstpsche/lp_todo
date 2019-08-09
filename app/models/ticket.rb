# frozen_string_literal: true

class Ticket < ApplicationRecord
  validates :title, presence: true

  has_many :ticket_labels
  has_many :labels, through: :ticket_labels

  has_many :notes, dependent: :destroy
  has_many :checklists, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_one :due_time, dependent: :destroy

  scope :oldest_first, -> { order(created_at: :asc) }
  scope :newest_first, -> { order(created_at: :desc) }
end
