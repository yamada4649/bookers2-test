class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # for posting image
  attachment :profile_image

  # association
  has_many :books, dependent: :destroy

  # validation
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

end
