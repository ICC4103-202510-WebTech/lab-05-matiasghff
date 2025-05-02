class Chat < ApplicationRecord
  # Associations
  belongs_to :sender,   class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many   :messages, dependent: :destroy

  # Validations
  validates :sender_id, :receiver_id, presence: true
  validate  :sender_and_receiver_must_differ

  private

  def sender_and_receiver_must_differ
    if sender_id == receiver_id
      errors.add(:receiver_id, "must be different from sender")
    end
  end
end
