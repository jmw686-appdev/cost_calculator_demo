class ShoplistsController < ApplicationController
  def index
    @shoplists = Shoplist.all

    render("shoplist_templates/index.html.erb")
  end

  def show
    @shoplist = Shoplist.find(params.fetch("id_to_display"))
    @ingredients = Recipe.find_by(name: @shoplist.name).ingredients
    render("shoplist_templates/show.html.erb")
  end

  def new_form
    render("shoplist_templates/new_form.html.erb")
  end

  def create_row
    @shoplist = Shoplist.new
    recipe = Recipe.find(params.fetch('id'))
    @shoplist.name = recipe.name
    @shoplist.sum = 0
    @shoplist.recipe_id = params.fetch("id")
    ingredients = Ingredient.where(recipe_id: recipe.id)
    if @shoplist.valid?
      @shoplist.save
      ingredients.each do |i|
        # ig = Ingredient.new
        # ig.name = i.name
        # ig.amount = i.amount
        # ig.units = i.units
        # ig.price = i.price
        i.save
      end
      redirect_back fallback_location: shoplist_path(@shoplist), notice: "Shoplist created successfully."
      # redirect_to("/shoplists", :notice => "Shoplist created successfully.")
    else
      render("shoplist_templates/new_form.html.erb")
    end
  end

  def edit_form
    @shoplist = Shoplist.find(params.fetch("prefill_with_id"))

    render("shoplist_templates/edit_form.html.erb")
  end

  def update_row
    @shoplist = Shoplist.find(params.fetch("id_to_modify"))

    @shoplist.name = params.fetch("name")
    @shoplist.sum = params.fetch("sum")
    @shoplist.recipe_id = params.fetch("recipe_id")

    if @shoplist.valid?
      @shoplist.save

      redirect_to("/shoplists/#{@shoplist.id}", :notice => "Shoplist updated successfully.")
    else
      render("shoplist_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @shoplist = Shoplist.find(params.fetch("id_to_remove"))

    @shoplist.destroy

    redirect_to("/shoplists", :notice => "Shoplist deleted successfully.")
  end
end
