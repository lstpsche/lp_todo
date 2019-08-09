# frozen_string_literal: true

class Content < ApplicationRecord
  belongs_to :ticket_content, polymorphic: true
  belongs_to :ticket
end
