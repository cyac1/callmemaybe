class Call < ApplicationRecord
  monetize :price_cents
  belongs_to :question
  belongs_to :reply
  has_many :reviews
  enum call_status: [:unconfirmed, :confirmed]
end
