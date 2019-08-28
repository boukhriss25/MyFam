class Tag < ApplicationRecord
  belongs_to :document
  validates :name, presence: true
  before_save :downcase_input

  def downcase_input
    name.downcase!
  end
end
