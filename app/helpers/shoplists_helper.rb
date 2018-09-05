module ShoplistsHelper
  def to_dash(a, b)
    case b
    when "dash"
      a
    when "pinch"
      a *= 2
    when "teaspoon"
      a *= 16
    when "tablespoon"
      a *= 48
    when "cup"
      a *= 768 # check this
    when "pound"
    when "oz fl"
      a *= 6144
    when "pint"
      a *= 12288
    when "quart"
      a *= 24576
    when "gallon"
      a *= 98304

    end
  end

  # given 'b' units, turn into a amount of teaspoon
  def to_teaspoon(a, b)
    case b
    when "dash"
      a /= 16
    when "pinch"
      a /= 8
    when "teaspoon"
      a
    when "tablespoon"
      a *= 3
    when "cup"
      a *= 48
    when "oz fl" || "fluid oz"
      a *= 6
    when "pint"
      a *= 96
    when "quart"
      a *= 192
    when "gallon"
      a *= 768
    end
  end

  def to_tablespoon(a, b)
    case b
    when "pinch"
    when "dash"
    when "teaspoon"
      a /= 3
    when "tablespoon"
      a
    when "cup"
      a *= 16
    when "oz fl" || "fluid oz"
      a *= 2
    when "pint"
      a *= 32
    when "quart"
      a *= 64
    when "gallon"
      a *= 256
    end
  end

  def to_cup(a, b)
    case b
    when "pinch"
    when "dash"
    when "teaspoon"
      a /= 48
    when "tablespoon"
      a /= 16
    when "cup"
      a
    when "oz fl" || "fluid oz"
      a /= 8
    when "pint"
      a *= 2
    when "quart"
      a *= 4
    when "gallon"
      a *= 16
    end
  end

  def to_fl_oz(a, b)
    case b
    when "pinch"
      a /= 48
    when "dash"
      a /= 96
    when "teaspoon"
      a /= 6
    when "tablespoon"
      a /= 2
    when "cup"
      a *= 8
    when "oz fl" || "fluid oz"
      a
    when "pint"
      a *= 16
    when "quart"
      a *= 32
    when "gallon"
      a *= 128
    end
  end

  def to_pint(a, b)
    case b
    when "pinch"
    when "dash"
    when "teaspoon"
      a /= 96
    when "tablespoon"
      a /= 32
    when "cup"
      a /= 2
    when "pound"
    when "oz fl" || "fluid oz"
      a /= 16
    when "pint"
      a
    when "quart"
      a *= 2
    when "gallon"
      a *= 8
    end
  end

  def to_quart(a, b)
    case b
    when "pinch"
    when "dash"
    when "teaspoon"
      a *= 0.005208
    when "tablespoon"
      a /= 64
    when "cup"
      a /= 4
    when "oz fl" || "fluid oz"
      a /= 32
    when "pint"
      a /= 2
    when "quart"
      a
    when "gallon"
      a /= 4
    end
  end

  def to_gallon(a, b)
    case b
    when "pinch"
    when "dash"
    when "teaspoon"
      a *= 768
    when "tablespoon"
      a *= 256
    when "cup"
      a *= 16
    when "oz fl" || "fluid oz"
      a *= 128
    when "pint"
      a *= 8
    when "quart"
      a *= 4
    when "gallon"
      a
    end
  end
end
