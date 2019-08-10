class Folder < ApplicationRecord
  has_many :tickets
  belongs_to :workspace, dependent: :destroy
end
