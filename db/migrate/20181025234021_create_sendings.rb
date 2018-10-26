class CreateSendings < ActiveRecord::Migration[5.2]
  def change
    create_table :sendings do |t|
      t.references :message, foreign_key: true
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
