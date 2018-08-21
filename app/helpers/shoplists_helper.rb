module ShoplistsHelper
  def to_dash(a, b)
    case b
    when 'dash'
      a
    when 'pinch'
      a *= 2
    when 'tsp'
      a *= 16
    when 'tbsp'
      a *= 48
    when 'cup'
      a *= 768 #check this
    when 'pound'
    when 'fl oz'
      a *= 6144
    when 'pint'
      a *= 12288
    when 'quart'
      a *= 24576
    when 'gallon'
      a *= 98304
    
    end
  end
  
  #given 'b' units, turn into a amount of tsp
  def to_tsp(a, b)
    case b
    when 'dash'
      a /= 16
    when 'pinch'
      a /= 8
    when 'tsp'
      a
    when 'tbsp'
      a *= 3
    when 'cup'
      a *= 48
    when 'fl oz'
      a *= 6
    when 'pint'
      a *= 96
    when 'quart'
      a *= 192
    when 'gallon'
      a *= 768
    end
  end  
  
  
  def to_tbsp(a, b)
    case b
    when 'pinch'
    when 'dash'
    when 'tsp'
      a /= 3
    when 'tbsp'
      a
    when 'cup'
      a *= 16
    when 'fl oz'
      a *= 2
    when 'pint'
      a *= 32
    when 'quart'
      a *= 64
    when 'gallon'
      a *= 256
    end
  end  
  
  def to_cup(a, b)
    case b
    when 'pinch'
    when 'dash'
    when 'tsp'
      a /= 48
    when 'tbsp'
      a /= 16
    when 'cup'
      a 
    when 'fl oz'
      a /= 8
    when 'pint'
      a *= 2
    when 'quart'
      a *= 4
    when 'gallon'
      a *= 16
    end
  end  
  
  def to_pound(a, b)
    case b
    when 'pinch'
    when 'dash'
    when 'tsp'
    when 'tbsp'
    when 'cup'
    when 'pound'
    when 'fl oz'
    when 'pint'
    when 'quart'
    when 'gallon'
    end
  end  
  
  def to_fl_oz(a, b)
    case b
    when 'pinch'
      a /= 48
    when 'dash'
      a /= 96
    when 'tsp'
      a /= 6
    when 'tbsp'
      a /= 2
    when 'cup'
      a *= 8
    when 'fl oz'
      a
    when 'pint'
       a *= 16
    when 'quart'
      a *= 32
    when 'gallon'
      a *= 128
    end
  end  
  
  def to_pint(a, b)
    case b
    when 'pinch'
    when 'dash'
    when 'tsp'
      a /= 96
    when 'tbsp'
      a /= 32
    when 'cup'
      a /= 2
    when 'pound'
    when 'fl oz'
      a /= 16
    when 'pint'
      a
    when 'quart'
      a *= 2
    when 'gallon'
      a *= 8
    end
  end  
  
  def to_quart(a, b)
    case b
    when 'pinch'
    when 'dash'
    when 'tsp'
      a *= 0.005208 
    when 'tbsp'
      a /= 64
    when 'cup'
      a /= 4
    when 'fl oz'
      a /= 32
    when 'pint'
      a /= 2
    when 'quart'
      a
    when 'gallon'
      a /= 4
    end
  end  
  
  def to_gallon(a, b)
    case b
    when 'pinch'
    when 'dash'
    when 'tsp'
      a *= 768
    when 'tbsp'
      a *= 256
    when 'cup'
      a *= 16
    when 'fl oz'
      a *= 128
    when 'pint'
      a *= 8
    when 'quart'
      a *= 4
    when 'gallon'
      a
    end
  end
end
