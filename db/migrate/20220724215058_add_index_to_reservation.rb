class AddIndexToReservation < ActiveRecord::Migration[7.0]
  def change
    add_index :reservations, :from
    add_index :reservations, :to
  end
end
