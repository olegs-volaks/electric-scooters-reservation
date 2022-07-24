class AddSubscribeToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column(:employees, :subscribe, :boolean, default: true, null: false)
  end
end
