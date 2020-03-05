RSpec.describe Product do
  let(:code) { :product_a }
  let(:name) { "A" }
  let(:price) { 30 }
  let(:new_price) { 10 }
  let(:subject) { described_class.new(code, name, price) }

  describe "@Product" do
    it 'has a code' do
      expect(subject.code).to eq(code)

    end

    it 'has a name' do
      expect(subject.name).to eq(name)
    end

    it 'has a price' do
      expect(subject.price).to eq(price)
    end

    it 'can change the price' do
      expect(subject.price).to eq(price)

      subject.price = new_price
      
      expect(subject.price).to eq(new_price)
    end
  end
end