class CreateAuditoria < ActiveRecord::Migration[5.2]
  def change
    create_table :auditoria do |t|
      t.text :name, null: false
      t.integer :seat_capacity, null: false, default: 0

      t.timestamps
    end
  end
end
