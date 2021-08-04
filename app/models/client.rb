class Client < ApplicationRecord

  validates :name, :email, :contact, :address, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :contact, length: {maximum: 11}

  has_many :projects

end
