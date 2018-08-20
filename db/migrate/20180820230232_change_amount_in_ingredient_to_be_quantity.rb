class ChangeAmountInIngredientToBeQuantity < ActiveRecord::Migration[5.2]
  def up
    change_column :ingredients, :amount, :integer
  end

  def down
    change_column :ingredients, :amount, :string
  end
end
