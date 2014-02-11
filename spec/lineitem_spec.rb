require_relative '../lib/lineitem'

describe 'LineItem' do

  let(:item_with_imported_tax) { '1 imported box of chocolates at 10.00' }
  let(:item_exempt_from_tax) { '1 book at 12.49'}
  let(:item_with_sales_tax) { '1 bottle of perfume at 18.99' }

  let(:lineitem_with_imported_tax) {  LineItem.new(item_with_imported_tax) }
  let(:lineitem_exempt_from_tax) { LineItem.new(item_exempt_from_tax) }
  let(:lineitem_with_sales_tax) { LineItem.new(item_with_sales_tax) }

  describe '#initialize' do
    it 'should not instantiates LineItem' do
      expect{ LineItem.new }.to raise_error(ArgumentError)
    end
  end

  describe '#to_s' do
    context 'item_with_imported_tax' do
      it 'prints updated line item' do
        expect(lineitem_with_imported_tax.to_s).to eql('1 imported box of chocolates: 10.50')
      end
    end

    context 'item_exempt_from_tax' do
      it 'prints updated line item' do
        expect(lineitem_exempt_from_tax.to_s).to eql('1 book: 12.49')
      end
    end

    context 'item_with_sales_tax' do
      it 'prints updates line item' do
        expect(lineitem_with_sales_tax.to_s).to eql('1 bottle of perfume: 20.89')
      end
    end
  end  

  describe '#total' do
    it 'calculate the total without tax' do
      expect(lineitem_with_imported_tax.total).to eql(10.0)
    end
  end

  describe '#total_with_tax' do
    context 'item_with_imported_tax' do
      it 'calculates imported goods' do
        expect(lineitem_with_imported_tax.total_with_tax).to eql(10.5)
      end
    end

    context 'item_exempt_from_tax' do
      it 'calculates goods exempt from tax' do
       expect(lineitem_exempt_from_tax.total_with_tax).to eql(12.49) 
     end
   end

   context 'item_with_sales_tax' do
    it 'calculates goods with sales tax' do
      expect(lineitem_with_sales_tax.total_with_tax).to eql(20.889999999999997) 
    end
  end
end

describe '#tax' do
  context 'item_with_imported_tax' do
    it 'calculates tax for imported goods' do
      expect(lineitem_with_imported_tax.tax).to eql(0.5)
    end
  end

  context 'item_exempt_from_tax' do
    it 'calculates tax for goods exempt from tax' do
      expect(lineitem_exempt_from_tax.tax).to eql(0.0)
    end
  end

  context 'item_with_sales_tax' do
    it 'calculates tax for goods with sales tax' do
      expect(lineitem_with_sales_tax.tax).to eql(1.9000000000000001) 
    end
  end
end

end