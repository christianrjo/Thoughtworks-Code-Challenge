require_relative '../lib/lineitem'

describe LineItem do
  let(:line_item) { LineItem.new(input) }

  describe '#initialize' do
    it 'should not instantiates LineItem' do
      expect{LineItem.new}.to raise_error(ArgumentError)
    end
  end

  describe '#to_s' do
    let(:input) { '1 imported box of chocolates at 10' }
    let(:result) { line_item.to_s }

    it 'returns formatted line item' do
      expect(result).to eql '1 imported box of chocolates: 10.50'
    end
  end

  describe '#total' do
    let(:input) { '1 imported box of chocolates at 10' }
    let(:result) { line_item.total }

    it 'calculates the total without tax' do
      expect(result).to eql 10.0
    end
  end

  describe '#total_with_tax' do
    let(:result) { line_item.total_with_tax }

    context 'with import taxed item' do
      let(:input) { '1 imported box of chocolates at 10' }

      it 'calculates the total with import tax' do
        expect(result).to eql 10.5
      end
    end

    context 'with sales taxed item' do
      let(:input) { '1 bottle of perfume at 18.99' }

      it 'calculates the total with sales tax' do
        expect(result).to eql 20.889999999999997
      end
    end

    context 'with tax exempt item' do
      let(:input) { '1 book at 12.49' }

      it 'calculates the total without tax' do
        expect(result).to eql 12.49
      end
    end
  end

  describe '#tax' do
    let(:result) { line_item.tax }

    context 'with import taxed item' do
      let(:input) { '1 imported box of chocolates at 10' }

      it 'calculates tax for imported item' do
        expect(result).to eql 0.5
      end
    end

    context 'with sales taxed item' do
      let(:input) { '1 bottle of perfume at 18.99' }

      it 'calculates tax for goods with sales tax' do
        expect(result).to eql 1.9000000000000001
      end
    end

    context 'with tax exempt item' do
      let(:input) { '1 book at 12.49' }

      it 'returns no tax' do
        expect(result).to eql 0.0
      end
    end
  end

  describe '#exempt?' do
    let(:result) { line_item.exempt? }

    context 'for a bottle of perfume' do
      let(:input) { '1 bottle of perfume at 18.99' }

      it 'checks for exempt goods' do
        expect(result).to eql false
      end
    end

    context 'for a book' do
      let(:input) { '1 book at 12.49' }

      it 'checks for exempt goods' do
        expect(result).to eql true
      end
    end
  end
end