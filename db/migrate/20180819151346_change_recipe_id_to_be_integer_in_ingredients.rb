class ChangeRecipeIdToBeIntegerInIngredients < ActiveRecord::Migration[5.2]
  def up
    change_column :ingredients, :recipe_id, :integer
  end

  def down
    change_column :ingredients, :recipe_id, :string
  end
end
