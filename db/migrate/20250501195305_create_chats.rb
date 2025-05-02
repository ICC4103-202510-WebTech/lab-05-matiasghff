class CreateChats < ActiveRecord::Migration[7.2]
  def change
    create_table :chats do |t|
      t.integer :sender_id,   null: false
      t.integer :receiver_id, null: false

      t.timestamps
    end

    add_index :chats, [ :sender_id, :receiver_id ], unique: true
  end
end
