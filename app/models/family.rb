class Family < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :documents
  has_many :users, through: :memberships
  validates :name, presence: true
end
