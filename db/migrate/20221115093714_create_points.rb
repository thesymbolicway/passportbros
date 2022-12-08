class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.string :name
      t.string :image
      t.text :note
      t.integer :user_id
      t.string :place_id
      t.string :category

      t.timestamps
    end
  end
end
