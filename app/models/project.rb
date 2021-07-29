class Project < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :client
end
