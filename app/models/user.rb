class User < ApplicationRecord
  enum role: { user: 'user', admin: 'admin' }
  MAX_NAME = 50
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: MAX_NAME }
end
