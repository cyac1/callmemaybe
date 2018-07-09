class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_one :call
end
