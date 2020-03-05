RSpec.describe Product do
  let(:new_price) { 10 }
  let(:product) { build(:product) }
  let(:subject) { build(:product) }

  describe "@Product" do
    it 'has a code' do
      expect(subject.code).to eq(product.code)

    end

    it 'has a name' do
      expect(subject.name).to eq(product.name)
    end

    it 'has a price' do
      expect(subject.price).to eq(product.price)
    end

    it 'can change the price' do
      expect(subject.price).to eq(product.price)

      subject.price = new_price

      expect(subject.price).to eq(new_price)
    end
  end
end