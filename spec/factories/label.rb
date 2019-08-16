# frozen_string_literal: true

FactoryBot.define do
  factory :label do
    color { '#000000' }
    ticket { create :ticket }
    title { 'label' }
  end
end
