require_relative 'receipt'

puts Receipt.new( File.readlines(ARGV[0]) )

