class CreateChats < ActiveRecord::Migration[7.1]
  def up
    create_table :chats do |t|
      t.integer :chat_type, null: false, default: 0 # 0: public, 1: direct, 2: group
      t.string :name

      t.timestamps
    end

    Chat.create(chat_type: 0, name: "Default Public Chat")
  end

  def down
    drop_table :chats
  end
end
