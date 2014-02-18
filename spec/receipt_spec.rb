require_relative '../lib/receipt'
require_relative '../lib/lineitem'


describe Receipt, '#initialize' do
  it 'should not instantiates Receipt' do
    expect{Receipt.new}.to raise_error(ArgumentError)
  end
end

describe Receipt, '#to_s' do
  it 'prints updated receipt' do
    lineitem = double('LineItem')
    allow(lineitem).to receive(:to_s)
    allow(lineitem).to receive(:total_with_tax).and_return(0.05)
    allow(lineitem).to receive(:tax).and_return(0.10)
    
    result = Receipt.new([lineitem]).to_s
    expect(result).to eql "\nSales Taxes: 0.10\nTotal: 0.05"
  end
end

describe Receipt, '#total' do
  it 'calculates total of all line items without tax' do
    line_items = [
      double(total_with_tax: 7),
      double(total_with_tax: 8),
    ]
    result = Receipt.new(line_items).total
    expect(result).to eql 15.0
  end
end

describe Receipt, '#total_tax' do
  it 'returns the summation of tax for line items' do
    line_items = [
      double(tax: 5),
      double(tax: 2),
    ]
    result = Receipt.new(line_items).total_tax
    expect(result).to eql 7
  end 
end

