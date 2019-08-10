# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :workspace_item, polymorphic: true
  belongs_to :workspace
end
