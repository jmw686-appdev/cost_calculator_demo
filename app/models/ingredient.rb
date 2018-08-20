class Ingredient < ApplicationRecord
  belongs_to :recipe
  has_one :item
end
