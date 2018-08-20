class AddUnitCostToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :unit_cost, :decimal
  end
end
