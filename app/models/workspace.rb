class Workspace < ApplicationRecord
  has_many :tickets
  has_many :folders
end
