# frozen_string_literal: true

class Item < ApplicationRecord
  validates_with Validators::Base, fields: %i[position]

  belongs_to :workspace_item, polymorphic: true
  belongs_to :workspace
end
