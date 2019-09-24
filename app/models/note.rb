class Note < ApplicationRecord
  belongs_to :user
  belongs_to :family
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations
  validates :title, presence: true
end
