require_relative 'lineitem'

class Receipt    

  def initialize lineitems
    @line_items = lineitems
  end

  def to_s
    output = @line_items.map(&:to_s)
    output << "Sales Taxes: #{"%.2f" % total_tax}"
    output << "Total: #{"%.2f" % total}"
    output.join("\n")
  end

  def total
     @line_items.map(&:total_with_tax).reduce(:+).round(2)
  end

  def total_tax
    @line_items.map(&:tax).reduce(:+)
  end

end

