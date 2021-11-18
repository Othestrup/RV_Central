class AddCoordinatesToCampers < ActiveRecord::Migration[6.0]
  def change
    add_column :campers, :latitude, :float
    add_column :campers, :longitude, :float
  end
end
