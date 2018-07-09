class Question < ApplicationRecord
  has_many :replies, dependent: :destroy
  has_many :calls
  belongs_to :user
  belongs_to :category
end
