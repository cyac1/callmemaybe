class Call < ApplicationRecord
  belongs_to :question
  belongs_to :reply
  has_many :reviews
end
