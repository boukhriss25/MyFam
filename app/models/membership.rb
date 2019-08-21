class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :family
  validates :user, uniqueness: { scope: :family }
end
