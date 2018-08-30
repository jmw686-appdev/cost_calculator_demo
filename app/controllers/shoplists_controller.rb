class ShoplistsController < ApplicationController
  include ShoplistsHelper
  
  def index
    @shoplists = Shoplist.all

    render("shoplist_templates/index.html.erb")
  end

  def show
    @shoplist = Shoplist.find(params.fetch("id_to_display"))
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
    # ingredients = Ingredient.where(recipe_id: recipe.id)
    ingredients = recipe.ingredients
    if @shoplist.valid?
      @shoplist.save
      ingredients.each do |i|
        item = Item.new
        item.name = i.name
        item.amount = i.quantity
        item.units = i.units
        item.price = 0
        item.shoplist_id = @shoplist.id
        item.save
      end
      redirect_to @shoplist, notice: "Shoplist created successfully."
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
    # @shoplist.sum = params.fetch("sum")
    sum = 0
    @shoplist.recipe_id = params.fetch("recipe_id")
    @shoplist.items.each do |i|
      sum += i.price
    end
    @shoplist.sum = sum
    if @shoplist.valid?
      @shoplist.save

      redirect_to("/shoplists/#{@shoplist.id}", :notice => "Shoplist updated successfully.")
    else
      render("shoplist_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @shoplist = Shoplist.find(params.fetch("id_to_remove"))
    recipe = @shoplist.recipe_id
    @shoplist.destroy

    redirect_to("/recipes/#{recipe}", :notice => "Shoplist deleted successfully.")
  end


  def calc
    @shoplist = Shoplist.find(params.fetch('id'))
    @recipe = Recipe.find(@shoplist.recipe_id)
    temp_ingredient_cost = 0
    @running_sum = 0
    custom_unit = false
    j = 0
    (1..@shoplist.items.size).each do |j|
      j -= 1
      s = @shoplist.items[j]
      r = @recipe.ingredients[j]
      # ratio = @shoplist.items[j].amount / @recipe.ingredients[j].quantity
      # @ratio = s.amount / r.quantity
      #TODO switch statement to pick what helper to run
      #use that new ratio to get a item unit cost
      #1 create ingredients and item lists
      #2 get price and full units for items
      #3 convert units of item to match recipe ingredient units
      #4 divide ingredient quantity by item amount
      #5 multiply ratio from #4 by item cost
      #6 add
      ingredient_unitwise = nil
      if Unitwise.search(r.units).empty?
        custom_unit = true
        if (s.units != r.units)
          redirect_to "/shoplists/#{@shoplist.id}", :notice => "Units: #{r.name}- 
            #{r.quantity} #{r.units} in Recipe #{@recipe.name} is not 
            compatible to convert to #{s.name}- #{s.amount} #{s.units}"
          return
        end
      end
      if !custom_unit
        ingredient_unitwise = Unitwise(r.quantity, r.units)
      else
        
      end
      case r.units
  
      when 'teaspoon'
        # @con = to_tsp(s.amount, s.units)
        #TODO move out into helper function to call on ALL units before case?
        if (ingredient_unitwise.compatible_with?(Unitwise(s.amount, s.units)))
          @con = Unitwise(s.amount, s.units).to_teaspoon
        else 
          #error
          redirect_to "/shoplists/#{@shoplist.id}", :notice => "Units: #{r.name}- 
                      #{r.quantity} #{r.units} in Recipe #{@recipe.name} is not 
                      compatible to convert to #{s.name}- #{s.amount} #{s.units}"
          return
        end
        
      when 'tablespoon'
        if s.units == 'pound'
          @con = to_tbsp(s.amount, s.units)
        else
          @con = Unitwise(s.amount, s.units).to_tablespoon
        end
      when 'cup'
        # @con = to_cup(s.amount, s.units)
        @con = Unitwise(s.amount, s.units).to_cup
  
      when 'oz fl'
        # @con = to_fl_oz(s.amount, s.units)
        @con = Unitwise(s.amount, s.units).to_fluid_ounce
        
      when 'oz'
        # @con = to_fl_oz(s.amount, s.units)
        @con = Unitwise(s.amount, s.units).to_ounce
        
  
      when 'pint'
        # @con = to_pint(s.amount, s.units)
        @con = Unitwise(s.amount, s.units).to_pint
  
      when 'quart'
        # @con = to_quart(s.amount, s.units)
        @con = Unitwise(s.amount, s.units).to_quart
  
      when 'gallon'
        # @con = to_gallon(s.amount, s.units)
        @con = Unitwise(s.amount, s.units).to_gallon

      else
        #TODO custom unit! enter the container
        if s.units != r.units
          #error form not valid
          redirect_to "/shoplists/#{@shoplist.id}", :notice => "Somehow, #{r.name}
          units (#{r.units}) in the recipe do not match units in the shoplist (#{s.units})"
        else
          #nothing to do since, they're already in the same units
          #maybe price per container?
          @con = Unitwise(1, r.units)
        end
      end 
      
      # temp_ingredient_cost = @shoplist.items[j].price / @ratio
      if custom_unit
        temp_ingredient_cost = @recipe.ingredients[j].quantity /
                        (@shoplist.items[j].amount) * @shoplist.items[j].price
        temp_ingredient_cost = @shoplist.items[j].price * @ratio

      else
        @ratio = r.quantity / @con
        r.measurement = @ratio
        temp_ingredient_cost = @shoplist.items[j].price * @ratio
      end
      @shoplist.items[j].unit_cost = temp_ingredient_cost
      @running_sum += temp_ingredient_cost
      if @shoplist.valid?
        @shoplist.save
      end
    end
    render 'shared/unit_cost'
  end
  
  
  
end
