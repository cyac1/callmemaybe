class Call < ApplicationRecord
  monetize :price_cents
  belongs_to :reply, optional: true
  belongs_to :question, optional: true
  belongs_to :conversation, optional: true
  has_many :review
  enum call_status: [:unconfirmed, :confirmed]

  validates :call, uniqueness: true, if: :first_call?

  def question_author
    question.user
  end

  def reply_author
    reply.user
  end

  def first_call?
    Call.where("reply_id = ?", reply.id).empty?
  end
end
