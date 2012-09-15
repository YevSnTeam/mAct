class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :dialog_id
      t.text :body
      t.boolean :received
      t.boolean :deleted_by_sender
      t.boolean :deleted_by_recipient

      t.timestamps
    end
  end
end
