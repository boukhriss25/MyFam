class Conversation < ApplicationRecord
  belongs_to :family
  has_many :messages, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
  after_create :default_avatar

  # DEFAULT_AVATAR = "f5psjysh6j1nsoxzqgyx"
  def default_avatar
    if name == "Main chat"
      self.remote_avatar_url = "https://res.cloudinary.com/glenwarren/#{family[:avatar]}"
    else
      self.remote_avatar_url = "https://res.cloudinary.com/glenwarren/image/upload/v1566916585/nqsmgxawxwk1qirqom3s.jpg" unless avatar.present?
    end
  end
end
