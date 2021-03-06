class ItemsController < ApplicationController
  def index
    @items = Item.all

    render("item_templates/index.html.erb")
  end

  def show
    @item = Item.find(params.fetch("id_to_display"))

    render("item_templates/show.html.erb")
  end

  def new_form
    render("item_templates/new_form.html.erb")
  end

  def create_row
    @item = Item.new

    @item.name = params.fetch("name")
    @item.amount = params.fetch("amount")
    units = params.fetch("units")
    case units

    when 'tsp'
      units = 'teaspoon'
    when 'tbsp'
      units = 'tablespoon'
    when 'lbs'
      units = 'pound'
    when 'ounce'
      units = 'oz'
    when 'fluid oz'
      units = 'oz fl'
    end
    @item.units = units
    @item.price = params.fetch("price")
    @item.shoplist_id = params.fetch("shoplist_id")

    if @item.valid?
      @item.save

      redirect_to("/shoplists/#{@item.shoplist_id}", :notice => "Item created successfully.")
    else
      render("item_templates/new_form.html.erb")
    end
  end

  def edit_form
    @item = Item.find(params.fetch("prefill_with_id"))

    render("item_templates/edit_form.html.erb")
  end

  def update_row
    @item = Item.find(params.fetch("id_to_modify"))

    @item.name = params.fetch("name")
    @item.amount = params.fetch("amount")
    units = params.fetch("units")
    case units

    when ''
      units = @item.units
    when 'tsp'
      units = 'teaspoon'
    when 'tbsp'
      units = 'tablespoon'
    when 'lbs'
      units = 'pound'
    when 'ounce'
      units = 'oz'
    when 'fluid oz'
      units = 'oz fl'
    end
    @item.units = units
    @item.price = params.fetch("price")
    @shoplist = Shoplist.find(@item.shoplist_id)
    @shoplist.sum = 0
    if @item.valid?
      @item.save
      @shoplist.items.each do |i|
        @shoplist.sum += i.price
      end
      @shoplist.save
      redirect_to(shoplist_path(@item.shoplist_id), :notice => "Item updated successfully.")
    else
      render("item_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @item = Item.find(params.fetch("id_to_remove"))

    @item.destroy

    redirect_to("/items", :notice => "Item deleted successfully.")
  end
end
