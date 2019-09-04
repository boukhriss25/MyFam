class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :documents
  has_many :shares
  has_many :subscriptions, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :families, through: :memberships
  has_many :conversations, through: :subscriptions
  mount_uploader :avatar, AvatarUploader
  after_create :default_avatar

  def default_avatar
    self.remote_avatar_url = "https://res.cloudinary.com/glenwarren/image/upload/b_rgb:eefbfc,o_60/v1566486677/fj2ly83omwurmjxi2ltu.png" unless self.avatar.present?
  end
end
