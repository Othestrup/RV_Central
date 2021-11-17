class AddAddressToCampers < ActiveRecord::Migration[6.0]
  def change
    add_column :campers, :address, :string
  end
end
