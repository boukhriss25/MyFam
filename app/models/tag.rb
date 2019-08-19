class Tag < ApplicationRecord
  belongs_to :media
  validates :name, presence: true
end
