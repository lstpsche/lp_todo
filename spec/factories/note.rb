# frozen_string_literal: true

FactoryBot.define do
  factory :note do
    text { 'note text' }
    ticket { create :ticket }
    title { 'ticket' }
  end
end
