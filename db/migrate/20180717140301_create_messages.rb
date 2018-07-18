class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.datetime :opened_at
      t.string :message_type
      t.references :sender
      t.references :receiver
      t.references :conversation, foreign_key: true

      t.timestamps
    end
  end
end
