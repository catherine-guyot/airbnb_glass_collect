class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :address
      t.string :city
      t.integer :number_of_guests
      t.integer :price_per_night
      t.text :description

      t.timestamps
    end
  end
end
