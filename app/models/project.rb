class Project < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :client
  has_many :comments, dependent: :destroy
  has_many :payments
end
