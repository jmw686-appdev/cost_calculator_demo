class Shoplist < ApplicationRecord
  has_one :recipe
  has_many :ingredients #, dependent: :destroy are the ingredients the same literal objects as the ones in recipe?
end
