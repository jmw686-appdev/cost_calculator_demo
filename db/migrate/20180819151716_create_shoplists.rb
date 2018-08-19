class CreateShoplists < ActiveRecord::Migration[5.2]
  def change
    create_table :shoplists do |t|
      t.string :name
      t.decimal :sum
      t.integer :recipe_id

      t.timestamps
    end
  end
end
