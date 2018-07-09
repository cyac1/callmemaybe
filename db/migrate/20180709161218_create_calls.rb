class CreateCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :calls do |t|
      t.integer :call_status
      t.date :datetime
      t.references :question, foreign_key: true
      t.references :reply, foreign_key: true

      t.timestamps
    end
  end
end
