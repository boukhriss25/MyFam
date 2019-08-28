class Document < ApplicationRecord
  belongs_to :family
  belongs_to :user
  belongs_to :folder, optional: true
  has_many :tags, dependent: :destroy
  has_many :shares, dependent: :destroy
  validates :content, presence: true
  # validates :doc_type, presence: true
  mount_uploader :content, DocumentUploader
  after_create :default_tag

  scope :by_tag, ->(tag) { joins(:tags).where("tags.name = ?", tag) }

  # def self.by_tag(tag)
  #   Document.joins(:tags).where("tags.name = ?", tag)
  # end

  def default_tag
    Tag.create(name: "untagged", document: self)
  end
end
