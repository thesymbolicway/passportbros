class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.string :username
      t.integer :user_id
      t.integer :place_id
      t.string :parent_id

      t.timestamps
    end
  end
end
