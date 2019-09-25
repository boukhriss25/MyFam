class Note < ApplicationRecord
  belongs_to :family
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations
  validates :title, presence: true, uniqueness: { scope: :family }

  # after_create :default_title

  # def default_title
  #   Tag.create(name: "untitled", document: self)
  # end
end
