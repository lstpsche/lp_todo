# frozen_string_literal: true

FactoryBot.define do
  factory :checklist do
    ticket { create :ticket }
    title { 'checklist' }
  end
end
