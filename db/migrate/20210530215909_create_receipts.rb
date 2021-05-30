class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.datetime :purchased_at, null: false
      t.text :customer_name, null: false
      t.text :customer_email, null: false
      t.text :credit_card_number, null: false
      t.date :credit_card_expiration, null: false
      t.belongs_to :showtime

      t.timestamps
    end
  end
end
