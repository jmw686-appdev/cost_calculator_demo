class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    render("recipe_templates/index.html.erb")
  end

  def show
    @recipe = Recipe.find(params.fetch("id_to_display"))

    render("recipe_templates/show.html.erb")
  end

  def new_form
    render("recipe_templates/new_form.html.erb")
  end

  def create_row
    @recipe = Recipe.new
    @ingredient = Ingredient.new

    @ingredient.name = params.fetch("i-name")
    units = params.fetch("units")
    case units

    when "tsp"
      units = "teaspoon"
    when "tbsp"
      units = "tablespoon"
    when "lbs"
      units = "pound"
    when "ounce"
      units = "oz"
    when "fluid oz"
      units = "oz fl"
    end
    @ingredient.units = units
    @ingredient.quantity = params.fetch("quantity")
    @recipe.name = params.fetch("name")
    @recipe.user_id = params.fetch("user_id")
    if @recipe.valid?
      @recipe.save
      @ingredient.recipe_id = @recipe.id
      @ingredient.save
      redirect_to("/recipes/#{@recipe.id}", notice: "Recipe created successfully.")
    else
      render("recipe_templates/new_form.html.erb")
    end
  end

  def edit_form
    @recipe = Recipe.find(params.fetch("prefill_with_id"))

    render("recipe_templates/edit_form.html.erb")
  end

  def update_row
    @recipe = Recipe.find(params.fetch("id_to_modify"))

    @recipe.name = params.fetch("name")
    @recipe.user_id = params.fetch("user_id")

    if @recipe.valid?
      @recipe.save

      redirect_to("/recipes/#{@recipe.id}", notice: "Recipe updated successfully.")
    else
      render("recipe_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @recipe = Recipe.find(params.fetch("id_to_remove"))

    @recipe.destroy

    redirect_to("/recipes", notice: "Recipe deleted successfully.")
  end
end
