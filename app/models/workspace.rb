# frozen_string_literal: true

class Workspace < ApplicationRecord
  validates_with Validators::Base, fields: %i[title]

  has_many :tickets, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_many :items, dependent: :destroy
end
