class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name
      t.text :password
      t.text :role
      t.text :email
      t.text :credit_card_number
      t.date :credit_card_expiration

      t.timestamps
    end
  end
end
