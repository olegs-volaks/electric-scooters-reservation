class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :scooter, foreign_key: true
      t.references :employee, foreign_key: true
      t.datetime :from, null: false
      t.datetime :to, null: false
      t.timestamps
    end
  end
end
