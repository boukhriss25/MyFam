class Family < ApplicationRecord
  has_many :memberships
  has_many :conversations
  has_many :medias
  has_many :users, through: :memberships
  validates :name, presence: true
end
