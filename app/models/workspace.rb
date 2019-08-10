# frozen_string_literal: true

class Workspace < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_many :items, dependent: :destroy
end
