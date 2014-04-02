require_relative '../lib/receipt'

describe "output" do
  let(:line_items) { input.map{ |text| LineItem.new(text.chomp("\n")) } }
  let(:receipt) { Receipt.new(line_items) }

  context 'with input 1' do
    let(:input) { File.readlines('data/input1.txt') }
    let(:output) do
      "1 book: 12.49\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 29.83"
    end

    it "produces a receipt" do
      expect(receipt.to_s).to eql(output)
    end
  end

  context 'with input 2' do
    let(:input) { File.readlines('data/input2.txt') }
    let(:output) do
      "1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15"
    end

    it "produces a receipt" do
      expect(receipt.to_s).to eql(output)
    end
  end

  context 'with input 3' do
    let(:input) { File.readlines('data/input3.txt') }
    let(:output) do
      "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n1 box of imported chocolates: 11.85\nSales Taxes: 6.70\nTotal: 74.68"
    end

    it "returns output 3" do
      expect(receipt.to_s).to eql(output)
    end
  end
end