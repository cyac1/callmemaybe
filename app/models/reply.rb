class Reply < ApplicationRecord
  monetize :offer_cents, as: "offer"
  belongs_to :user
  belongs_to :question
  has_one :call
  enum reply_status: [:pending, :accepted, :rejected]

  def accepted?
    @reply_status == :accepted
  end

  def pending?
    @reply_status == :pending
  end

  def rejected?
    @reply_status == :rejected
  end

  def accept_reply
    @reply_status = 1
  end

  def reject_reply
    @reply_status = 2
  end
end
