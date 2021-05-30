class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :title, null: false
      t.float :duration, null: false, default: 0
      t.text :rating, null: false

      t.timestamps
    end
  end
end
