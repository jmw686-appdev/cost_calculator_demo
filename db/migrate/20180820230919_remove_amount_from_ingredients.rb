class RemoveAmountFromIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :amount, :string
  end
end
