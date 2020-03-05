RSpec.describe Checkout do
  let(:checkout) { described_class.new(promotional_rules) }

  let(:product_a) { build(:product, code: "A", price: 30)}
  let(:product_b) { build(:product, code: "B", price: 20)}
  let(:product_c) { build(:product, code: "C", price: 50)}
  let(:product_d) { build(:product, code: "D", price: 15)}

  let(:promotional_rules) do
    {
      "A" => proc do |code, items|
        if code == "A" && items.length > 2
          items.each do |item|
            item.price = 25
          end
        end
      end,
    
      "B" => proc do |code, items| 
        if code == "B" && items.length > 1
          items.each do |item|
            item.price = 17.50
          end
        end
      end,
    
      "total_discount_rule" => proc do |price| 
        if price > 150
          price = price - 20
        else 
          price
        end
      end
    }
  end

  let(:cart) { {} }

  describe "#initialize" do
    it "should set the instance variables @promotional_rules, @cart" do
      expect(checkout.promotional_rules).to eq(promotional_rules)
      expect(checkout.cart).to eq(cart)
    end
  end


  describe "scan" do 
    it 'should scan items' do
      checkout.scan(product_a)
      checkout.scan(product_a)

      expect(checkout.total).to eq(60)
    end

    it 'applies A Promotion when 3 or more products A are added' do
      checkout.scan(product_a)
      checkout.scan(product_a)
      checkout.scan(product_a)

      expect(checkout.total).to eq(75)
    end

    it 'applies B Promotion when 2 or more products B are added' do
      checkout.scan(product_b)
      checkout.scan(product_b)
      checkout.scan(product_b)

      expect(checkout.total).to eq(52.50)
    end

    it 'should discount 20 when the price is larger than 150' do
      checkout.scan(product_c)
      checkout.scan(product_c)
      checkout.scan(product_c)
      checkout.scan(product_d)

      expect(checkout.total).to eq(145)
    end
  end
end