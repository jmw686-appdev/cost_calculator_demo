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
    @item.units = params.fetch("units")
    @item.price = params.fetch("price")
    @item.shoplist_id = params.fetch("shoplist_id")

    if @item.valid?
      @item.save

      redirect_to("/items", :notice => "Item created successfully.")
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
    @item.units = params.fetch("units")
    @item.price = params.fetch("price")
    @item.shoplist_id = params.fetch("shoplist_id")

    if @item.valid?
      @item.save

      redirect_to("/items/#{@item.id}", :notice => "Item updated successfully.")
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
