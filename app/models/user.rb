class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :replies, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
