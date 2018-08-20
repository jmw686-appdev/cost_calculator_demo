class AddQuantityToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :quantity, :decimal
  end
end
