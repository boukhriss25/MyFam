class Tag < ApplicationRecord
  belongs_to :document
  validates :name, presence: true
end
