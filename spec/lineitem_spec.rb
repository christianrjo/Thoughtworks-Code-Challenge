require_relative '../lib/lineitem'

describe LineItem, '#initialize' do
  it 'should not instantiates LineItem' do
    expect{LineItem.new}.to raise_error(ArgumentError)
  end
end

describe LineItem, '#to_s' do
  it 'prints updated line item' do
    item = '1 imported box of chocolates at 10'

    result = LineItem.new(item).to_s
    expect(result).to eql '1 imported box of chocolates: 10.50'
  end
end

describe LineItem, '#total' do
  it 'calculate the total without tax' do
    item = '1 imported box of chocolates at 10'

    result = LineItem.new(item).total
    expect(result).to eql 10.0
  end
end

describe LineItem, '#total_with_tax' do
  context 'item with imported tax' do
    it 'calculate the total without tax' do
      item = '1 imported box of chocolates at 10'

      result = LineItem.new(item).total_with_tax
      expect(result).to eql 10.5
    end
  end
end

describe LineItem, '#total_with_tax' do
  context 'item exempt from tax' do
    it 'calculate the total without tax' do
      item = '1 book at 12.49'

      result = LineItem.new(item).total_with_tax
      expect(result).to eql 12.49
    end
  end
end

describe LineItem, '#total_with_tax' do
  context 'item with sales tax' do
    it 'calculate the total without tax' do
      item = '1 bottle of perfume at 18.99'

      result = LineItem.new(item).total_with_tax
      expect(result).to eql 20.889999999999997
    end
  end
end

describe LineItem, '#tax' do
  context 'item with imported tax' do
    it 'calculates tax for imported goods' do
      item = '1 imported box of chocolates at 10'

      result = LineItem.new(item).tax
      expect(result).to eql 0.5
    end
  end
end

describe LineItem, '#tax' do
  context 'item exempt from tax' do
    it 'calculates tax for goods exempt from tax' do
      item = '1 book at 12.49'

      result = LineItem.new(item).tax
      expect(result).to eql 0.0
    end
  end
end

describe LineItem, '#tax' do
  context 'item with sales tax' do
    it 'calculates tax for goods with sales tax' do
      item = '1 bottle of perfume at 18.99'

      result = LineItem.new(item).tax
      expect(result).to eql 1.9000000000000001
    end
  end
end

describe LineItem, '#exempt?' do
  context 'for a bottle of perfume' do
    it 'checks for exempt goods' do
      item = '1 bottle of perfume at 18.99'

      result = LineItem.new(item).exempt?
      expect(result).to eql false
    end
  end
end

describe LineItem, '#exempt?' do
  context 'for a bottle of perfume' do
    it 'checks for exempt goods' do
      item = '1 book at 12.49'

      result = LineItem.new(item).exempt?
      expect(result).to eql true
    end
  end
end
