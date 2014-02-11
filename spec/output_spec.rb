# require_relative 'lineitem'
require_relative '../lib/receipt'

describe "output" do

  it "returns output 1" do
    input1 = Receipt.new('data/input1.txt')
    expect(input1.to_s).to eql("1 book: 12.49\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 29.83")
  end

  it "returns output 2" do
    input2 = Receipt.new('data/input2.txt')
    expect(input2.to_s).to eql("1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15")
  end

  it "returns output 3" do
    input3 = Receipt.new('data/input3.txt')
    expect(input3.to_s).to eql("1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n1 box of imported chocolates: 11.85\nSales Taxes: 6.70\nTotal: 74.68")
  end

end