# frozen_string_literal: true

class User < ApplicationRecord
  MAX_NAME = 50
  enum role: { user: USER = 'user', admin: ADMIN = 'admin' }

  has_many :orders, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: MAX_NAME }
end
