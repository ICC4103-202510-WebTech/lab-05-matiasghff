class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.integer :chat_id, null: false
      t.integer :user_id, null: false
      t.text    :body,    null: false

      t.timestamps
    end

    add_index :messages, :chat_id
    add_index :messages, :user_id
  end
end
