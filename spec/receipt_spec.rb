require_relative '../lib/receipt'
require_relative '../lib/lineitem'

describe 'Receipt' do

  let(:input_file) { 'data/input1.txt' }
  let(:receipt) {  Receipt.new(input_file) }

  describe '#initialize' do
    it 'should not instantiates LineItem' do
      expect{Receipt.new}.to raise_error(ArgumentError)
    end
  end

  describe '#to_s' do
    it 'prints updated receipt' do
      expect(receipt.to_s).to eql("1 book: 12.49\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 29.83")
    end
  end

  describe '#total' do
    it 'calculates total of all line items without tax' do
      expect(receipt.total).to eql(29.83)
    end
  end

  describe '#total_tax' do
    it 'calculates total tax for all items' do
      expect(receipt.total_tax).to eql(1.5)
    end
  end

end