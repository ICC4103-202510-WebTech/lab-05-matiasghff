class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new        # guest user (not logged in)

    # everyone can read everything
    can :read, :all

    return unless user.persisted?

    # authenticated users can create
    can :create, Message
    can :create, Chat
    can :create, User      # if you want to allow user creation via admin, otherwise skip

    # users can edit/update only their own messages
    can [ :update, :destroy ], Message, user_id: user.id

    # you might allow users to update their own profile:
    can [ :update ], User, id: user.id

    # chats: only sender or receiver can update/destroy
    can [ :update, :destroy ], Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end
  end
end
