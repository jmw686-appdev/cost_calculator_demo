class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :amount
      t.string :units
      t.decimal :price
      t.integer :shoplist_id

      t.timestamps
    end
  end
end
