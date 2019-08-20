class Conversation < ApplicationRecord
  belongs_to :family
  has_many :messages, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  validates :name, presence: true
end
