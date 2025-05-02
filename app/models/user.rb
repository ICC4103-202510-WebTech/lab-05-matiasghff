class User < ApplicationRecord
  # Associations
  has_many :messages,                     dependent: :destroy
  has_many :chats_as_sender,   class_name: "Chat", foreign_key: "sender_id",   dependent: :destroy
  has_many :chats_as_receiver, class_name: "Chat", foreign_key: "receiver_id", dependent: :destroy
  has_many :received_messages, through: :chats_as_receiver, source: :messages

  # Validations
  validates :email, presence: true, uniqueness: true
end
