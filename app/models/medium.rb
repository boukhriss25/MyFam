class Medium < ApplicationRecord
  belongs_to :family
  belongs_to :user
  belongs_to :folder, optional: true
  has_many :tags
  validates :content, prsence: true
  validates :type, presence: true
end
