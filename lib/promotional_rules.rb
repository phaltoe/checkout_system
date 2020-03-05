class PromotionalRules
  $promotional_rules = {}

  $promotional_rules["A"] = proc do |code, product|
    if code == "A" && product.length > 2
      product.each do |item|
        item.price = 25
      end
    end
  end

  $promotional_rules["B"] = proc do |code, product| 
    if code == "B" && product.length > 1
      product.each do |item|
        item.price = 17.50
      end
    end
  end

  $promotional_rules["total_discount_rule"] = proc do |price| 
    if price > 150
      price = price - 20
    else 
      price
    end
  end
end