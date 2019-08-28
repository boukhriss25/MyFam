class Share < ApplicationRecord
  belongs_to :conversation
  belongs_to :document
  validates :document, uniqueness: { scope: :conversation }
end
