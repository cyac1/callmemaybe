class Conversation < ApplicationRecord
  belongs_to :question, optional: true
  has_one :call
  has_many :messages
  monetize :offer_cents
  enum message_type: [:normal, :offer]


end
