class Message < ApplicationRecord
  # Associations
  belongs_to :chat
  belongs_to :user

  # Validations
  validates :body, presence: true
end
