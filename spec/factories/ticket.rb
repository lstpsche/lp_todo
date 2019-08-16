# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    folder { nil }
    posititon_in_folder { nil }
    title { 'ticket' }
    workspace { create :workspace }
  end
end
