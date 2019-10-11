puts "Hello, world!"

file = File.open(__FILE__, "r")

file.readlines.each do |lines|
  puts lines
end

