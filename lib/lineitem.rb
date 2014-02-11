class LineItem

 attr_reader :product, :price, :quantity

  SALES_TAX  = 0.10
  IMPORT_TAX = 0.05
  PRECISION = 0.05
  EXEMPT_PRODUCTS = ["chocolate", "book", "pills"]

  def initialize text
     match_data = /(?<quantity>^\d+) (?<name>[\w\s]+) at (?<price>[\d\.]+$)/.match(text)
     @quantity = match_data[:quantity].to_i
     @price = match_data[:price].to_f
     @product = match_data[:name]
  end

  def to_s 
    "#{@quantity} #{@product}: #{"%.2f" % total_with_tax}"
  end

  def total
    @quantity * @price
  end

  def total_with_tax
    total + tax
  end

  def tax
    tax = 0
    tax += total * IMPORT_TAX if imported?
    tax += total * SALES_TAX unless exempt?
    (tax / PRECISION ).ceil * PRECISION
  end

  def imported?
    @product =~ /imported/
  end

  def exempt?
    EXEMPT_PRODUCTS.any?{ |word| @product =~ Regexp.new(word) }
  end

end