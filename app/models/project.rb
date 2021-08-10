class Project < ApplicationRecord

  validates :title, :description, presence: true
  mount_uploader :file, AttachmentUploader

  belongs_to :client
  has_many :comments, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :time_logs

end
