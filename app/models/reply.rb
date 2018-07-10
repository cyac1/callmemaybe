class Reply < ApplicationRecord
  monetize :offer_cents, as: "offer"
  belongs_to :user
  belongs_to :question
  has_one :call
  enum reply_status: [:pending, :rejected, :accepted]
end
