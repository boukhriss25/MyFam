class Share < ApplicationRecord
  belongs_to :conversation
  belongs_to :document
  belongs_to :user
  validates :document, uniqueness: { scope: :conversation }
  # I question whether the above validation is necessary
end
