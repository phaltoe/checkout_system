# checkout_system
Koru Kids Technical Exercise (Ruby)

## Challenge

<div>
-------------------------------------------
<p>The task is to implement a checkout system that conforms to the following interface:</p>

<pre>
Product code  | Name                   | Price
----------------------------------------------------------
001           | A       | £30
002           | B       | £20
003           | C       | £50
004           | D       | £95
</pre>


<p>If 3 of Item A are purchased, the price for all 3 is £75.<p>
<p>If 2 of Item B are purchased, the price for both is £35.</p>
<p>If the total basket price (after previous discounts) is over £150, the basket receives a
discount of £20.</p>

<pre>
  co = Checkout.new(promotional_rules)
  co.scan(item)
  co.scan(item)
  price = co.total
</pre>

<p>Example Test Data</p>

<pre>
Basket              | Price

A, B, C             | £100
B, A, B, A, A       | £110
C, B, A, A, D, A, B | £155
C, A, D, A, A       | £140

</pre>
--------------------------------------------
</div>

<pre>
Run bundle
Run rspec
Run ruby script.rb
</pre>


## Design

###### For tackling this project, I used TDD and tried to decouple the important parts as:
- Product: it's only responsability is to create a product
- Promotional Rules: responsible for generating promotions 
- Checkout: responsible for reading the products in the cart + applying promotions and calculate the price

When applying the promotion in the cart, we do it dinamically, that way, we can always expand only changing the promotion details in one place(in the promotional rules).

For Testing I followed TDD principles and managed to test all important parts of the system.