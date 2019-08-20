class Document < ApplicationRecord
  belongs_to :family
  belongs_to :user
  belongs_to :folder, optional: true
  validates :content, presence: true
  validates :doc_type, presence: true
end
