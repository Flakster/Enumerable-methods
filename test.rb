#!/usr/bin/env ruby

# frozen_string_literal: true

require './enumerable.rb'

array1 = [1, 2, 3, 4]
array2 = %w[a b c d]
proc1 = proc { |n| n * 2 }

def multiply_els(array)
  array.my_inject(:*)
end

puts "\nMethods will be tested using this two arrays:\n\n"
puts 'array1= [1, 2, 3, 4]'
puts "array2= %w[a b c d]\n\n"

puts "1. Test for #my_each method:\n\n"
puts "\tarray1.my_each{ |e| p e}\n"
puts "=>\n\n"
array1.my_each { |e| p e }

puts "\n2. Test for  #my_each_with_index method:\n\n"
puts "\tarray2.my_each_with_index { |e, i| p \"\#{e} -> \#{i}\" }\n"
puts "=>\n\n"
array2.my_each_with_index { |e, i| p "#{e} -> #{i}" }

puts "\n3. Test for #my_select method:\n\n"
puts "\tprint array1.my_select{ |e| e > 2 }\n"
puts "=>\n\n"
print(array1.my_select { |e| e > 2 })

puts "\n\n4. Test for #my_all? method:\n\n"
puts "\tputs array1.my_all?{ |e| e >= 0}\n"
puts "=>\n\n"
puts(array1.my_all? { |e| e >= 0 })

puts "\n5. Test for #my_any? method:\n\n"
puts "\tputs array1.my_any?{ |e| e > 4}\n"
puts "=>\n\n"
puts(array1.my_any? { |e| e > 4 })

puts "\n6. Test for #my_none? method:\n\n"
puts "\tputs array1.my_none?{ |e| e > 4}\n"
puts "=>\n\n"
puts(array1.my_none? { |e| e > 4 })

puts "\n7. Test for #my_count method:\n\n"
puts "\tputs array1.my_count{ |e| e > 1}\n"
puts "=>\n\n"
puts(array1.my_count { |e| e > 1 })

puts "\n8. Test for #my_map method:\n\n"
puts "\tprint array2.my_map{ |e| e + \"x\"}\n"
puts "=>\n\n"
print(array2.my_map { |e| e + 'x' })

puts "\n\n9. Tests for #my_inject method:\n\n"
puts "\tputs array1.my_inject(:+)\n"
puts "=>\n\n"
puts array1.my_inject(:+)
puts "\tputs array1.my_inject(500, :+)\n"
puts "=>\n\n"
puts array1.my_inject(500, :+)
puts "\tputs array1.my_inject{ |m, e| m * e}\n"
puts "=>\n\n"
puts(array1.my_inject { |m, e| m * e })
puts "\tputs array1.my_inject(3){ |m, e| m * e}\n"
puts "=>\n\n"
puts(array1.my_inject(3) { |m, e| m * e })

puts "\n\n10. Test for #my_inject being used by method #multiply_els\n\n"
puts "\tdef multiply_els(array)"
puts "\t  array.my_inject(:*)"
puts "\tend\n\n"
puts "\tputs multiply_els(array1)\n"
puts "=>\n\n"
puts multiply_els(array1)

puts "\n\n11. Test for #my_map taking a proc instead of a block\n\n"
puts "\tproc1 = proc { |n| n *2 }"
puts "\tprint array1.my_map(proc1)\n"
puts "=>\n\n"
print array1.my_map(proc1)

puts "\n\v12. Tests for #my_map taking both a proc and a block:\n\n"
puts "\tprint array2.my_map{ |e| e + \"x\"} # taking a block\n\n"
puts "=>\n\n"
print(array2.my_map { |e| e + 'x' })
puts "\n\n\tprint array2.my_map(proc1) # proc1 = proc { |n| n *2 }\n\n"
puts "=>\n\n"
print array2.my_map(proc1)
puts "\n\n\tprint array2.my_map(proc1){ |e| e + \"x\"} # both"
puts "=>\n\n"
print(array2.my_map(proc1) { |e| e + 'x' })
puts "\n\nOnly executes the proc\n\n"
