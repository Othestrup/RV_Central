class CreateCampers < ActiveRecord::Migration[6.0]
  def change
    create_table :campers do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.text :review

      t.timestamps
    end
  end
end
