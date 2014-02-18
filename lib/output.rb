require_relative 'receipt'

array_of_line_items = File.readlines(ARGV[0])
lineitems = array_of_line_items.map{|text| LineItem.new(text.chomp("\n"))} 
puts Receipt.new( lineitems )

