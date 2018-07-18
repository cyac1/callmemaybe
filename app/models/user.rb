class User < ApplicationRecord
  mount_uploader :avatar, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :replies, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :reviews
  has_many :sent_messages, foreign_key: "sender_id", class_name: "Message"
  has_many :received_messages, foreign_key: "receiver_id", class_name: "Message"

  has_many :calls, through: :replies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :add_default_avatar

  def conversations
    Conversation.includes(:messages)
                .where(
                  "messages.sender_id = :user_id OR messages.receiver_id = :user_id",
                  user_id: id
                )
                .references(:messages)
  end

  def full_name
    "#{first_name&.downcase&.capitalize} #{last_name&.downcase&.capitalize}"
  end


  private

  def add_default_avatar
    update(remote_avatar_url: "https://smallbusinessbc.ca/wp-content/themes/sbbcmain/images/default-avatar.svg")
  end
end
