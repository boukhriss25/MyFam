class Collaboration < ApplicationRecord
  belongs_to :user
  belongs_to :note
  validates :user, uniqueness: { scope: :note }
end
