class Checkout 
  attr_reader :promotional_rules, :cart

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @cart = {}
  end

  def scan(item) 
    (@cart[item.code] ||= []) << item
  end

  def total 
    total = 0

    updated_cart = @cart.each do |key, value|
      @promotional_rules.has_key?(key) ? @promotional_rules[key].call(key, value) : value
    end

    updated_cart.each do |key, value|
      value.each { |item| total += item.price}
    end

    @promotional_rules["total_discount_rule"].call(total).round(2)
  end
end