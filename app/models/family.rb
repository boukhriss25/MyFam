class Family < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :documents
  has_many :users, through: :memberships
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader

  DEFAULT_AVATAR = "f5psjysh6j1nsoxzqgyx"
  def avatar
    read_attribute('avatar') || DEFAULT_AVATAR
  end
end
