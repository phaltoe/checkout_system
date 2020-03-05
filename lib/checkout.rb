class Checkout 
  attr_reader :promotional_rules, :cart

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @cart = {}
  end
end