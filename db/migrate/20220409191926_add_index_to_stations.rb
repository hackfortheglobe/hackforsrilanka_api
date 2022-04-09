class AddIndexToStations < ActiveRecord::Migration[7.0]
  def change
    add_index :stations, [:latitude, :longitude]
  end
end
