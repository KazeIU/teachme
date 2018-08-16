class RemoveLocationFromAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :location
    add_column :lessons, :location, :string
  end
end
