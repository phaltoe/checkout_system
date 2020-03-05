RSpec.describe Checkout do
  let(:subject) { described_class.new(promotional_rules) }

  let(:promotional_rules) do
    {
      :promo_01 => "fake_promo 01",
      :promo_02 => "fake_promo 02",
      :promo_03 => "fake_promo 03",
      :promo_04 => "fake_promo 04"
    }
  end

  let(:cart) { {} }

  describe "#initialize" do
    it "should set the instance variables @promotional_rules, @cart" do
      expect(subject.promotional_rules).to eq(promotional_rules)
      expect(subject.cart).to eq(cart)
    end
  end


  describe "scan" do 
    it 'should scan items' do

    end

    it 'should apply promotions' do

    end

    it 'should return the up to date cart price' do
      
    end
  end
end