# frozen_string_literal: true

class Ticket < ApplicationRecord
  validates_with Validators::Base, fields: %i[position_in_folder title]

  belongs_to :workspace

  has_many :ticket_labels
  has_many :labels, through: :ticket_labels

  has_many :notes, dependent: :destroy
  has_one :checklist, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_one :due_time, dependent: :destroy

  has_one :ticket_folder, dependent: :destroy
  has_one :folder, through: :ticket_folder

  scope :oldest_first, -> { order(created_at: :asc) }
  scope :newest_first, -> { order(created_at: :desc) }
end
