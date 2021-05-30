class CreateShowtimes < ActiveRecord::Migration[5.2]
  def change
    create_table :showtimes do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :seats_purchased, null: false, default: 0
      t.float :price, null: false,default: 0.0
      t.belongs_to :movie
      t.belongs_to :auditorium

      t.timestamps
    end
  end
end
