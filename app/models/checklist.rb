class Checklist < ApplicationRecord
  belongs_to :ticket
  has_one :content, as: :ticket_content, dependent: :destroy  
end
