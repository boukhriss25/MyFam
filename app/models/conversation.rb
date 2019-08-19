class Conversation < ApplicationRecord
  belongs_to :family
  has_many :messages
  has_many :subscriptions
  has_many :users, through: :subscriptions
  validates :name, presence: true
end
