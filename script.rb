require_relative 'lib/checkout'
require_relative 'lib/product'
require_relative 'lib/promotional_rules'

cart_1 = Checkout.new($promotional_rules)
cart_2 = Checkout.new($promotional_rules)
cart_3 = Checkout.new($promotional_rules)
cart_4 = Checkout.new($promotional_rules)

product_a = Product.new("A", "Product A", 30)
product_b = Product.new("B", "Product B", 20)
product_c = Product.new("C", "Product C", 50)
product_d = Product.new("D", "Product D", 15)

cart_1.scan(product_a)
cart_1.scan(product_b)
cart_1.scan(product_c)

cart_2.scan(product_b)
cart_2.scan(product_a)
cart_2.scan(product_b)
cart_2.scan(product_a)
cart_2.scan(product_a)

cart_3.scan(product_c)
cart_3.scan(product_b)
cart_3.scan(product_a)
cart_3.scan(product_a)
cart_3.scan(product_d)
cart_3.scan(product_a)
cart_3.scan(product_b)

cart_4.scan(product_c)
cart_4.scan(product_a)
cart_4.scan(product_d)
cart_4.scan(product_a)
cart_4.scan(product_a)


puts "BASKET   ITEMS                 PRICE"
puts "-------------------------------------"
puts "\n"
puts "CART 1   A,B,C                 £#{cart_1.total.floor}"
puts "CART 2   B, A, B, A, A         £#{cart_2.total.floor}"
puts "CART 3   C, B, A, A, D, A, B   £#{cart_3.total.floor}"
puts "CART 4   C, A, D, A, A         £#{cart_4.total.floor}"


