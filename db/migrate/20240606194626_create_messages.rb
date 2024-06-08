class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :chat_room, null: false, foreign_key: {to_table: :users}
      t.text :content
      
      t.timestamps
    end
  end
end
