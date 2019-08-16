# frozen_string_literal: true

FactoryBot.define do
  factory :folder do
    title { 'folder' }
    workspace { create :workspace }
  end
end
