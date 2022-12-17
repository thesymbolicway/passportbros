class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false  # add null: false to ensure that the body field is required
      t.string :username, null: false  # add null: false to ensure that the username field is required
      t.integer :user_id, null: false  # add null: false to ensure that the user_id field is required
      t.integer :place_id, null: false  # add null: false to ensure that the place_id field is required
      t.integer :parent_id

      t.timestamps
    end
  end
end
