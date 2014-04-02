require_relative '../lib/receipt'
require_relative '../lib/lineitem'

describe Receipt do
  let(:receipt) { Receipt.new(line_items) }

  describe '#initialize' do
    it 'should not instantiates Receipt' do
      expect{Receipt.new}.to raise_error(ArgumentError)
    end
  end

  describe '#to_s' do
    let(:line_items) do
      line_item = double('LineItem')
      allow(line_item).to receive(:to_s)
      allow(line_item).to receive(:total_with_tax).and_return(0.05)
      allow(line_item).to receive(:tax).and_return(0.10)
      [line_item]
    end
    let(:result) { receipt.to_s }

    it 'prints updated receipt' do
      expect(result).to eql "\nSales Taxes: 0.10\nTotal: 0.05"
    end
  end

  describe '#total' do
    let(:line_items) do
      [
        double(total_with_tax: 7),
        double(total_with_tax: 8),
      ]
    end
    let(:result) { receipt.total }

    it 'calculates total of all line items without tax' do
      expect(result).to eql 15.0
    end
  end

  describe Receipt, '#total_tax' do
   let(:line_items) do
      [
        double(tax: 5),
        double(tax: 2),
      ]
    end
    let(:result) { receipt.total_tax }

    it 'returns the summation of tax for line items' do
      expect(result).to eql 7
    end
  end
end