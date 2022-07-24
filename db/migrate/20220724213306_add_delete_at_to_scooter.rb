class AddDeleteAtToScooter < ActiveRecord::Migration[7.0]
  def change
    add_column(:scooters, :deleted_at, :datetime)
    add_index(:scooters, :deleted_at)
  end
end
