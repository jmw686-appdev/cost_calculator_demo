class Shoplist < ApplicationRecord
  has_one :recipe
  has_many :items, dependent: :destroy # are the ingredients the same literal objects as the ones in recipe?

  def unit_cost
    #code
  end
end
