class Folder < ApplicationRecord
  has_many :media
  validates :name, presence: true
end
