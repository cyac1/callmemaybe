class Call < ApplicationRecord
  monetize :price_cents
  belongs_to :reply, optional: true
  belongs_to :question, optional: true
  belongs_to :conversation, optional: true
  has_many :review
  enum call_status: [:unconfirmed, :confirmed]

  def question_author
    question.user
  end

  def reply_author
    reply.user
  end
end
