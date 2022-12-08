class CreatePlace < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :city
      t.string :country
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
