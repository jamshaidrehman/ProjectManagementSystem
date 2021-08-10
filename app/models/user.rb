class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, AttachmentUploader

  has_many :comments

  ROLE= {
            admin: 'Admin' ,
            manager: 'Manager',
            member: 'Member'
        }

  enum role: ROLE

  def active_for_authentication?
    super && is_active?
  end

end
