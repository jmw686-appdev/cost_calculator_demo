class ChangeRecipeIdToBeIntegerInIngredients < ActiveRecord::Migration[5.2]
  change_column :ingredients, :recipe_id, :integer, using: "recipe_id::integer"
end
