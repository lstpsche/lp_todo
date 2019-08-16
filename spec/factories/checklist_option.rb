# frozen_string_literal: true

FactoryBot.define do
  factory :checklist_option do
    checklist { create :checklist }
    text { 'option text' }
  end
end
