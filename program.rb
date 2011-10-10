#!/usr/bin/env ruby

$: << "#{ File.dirname( __FILE__ ) }/lib/"
require 'turing_machine'

puts "---------------------------------------------"
puts "ex1 accepts the language a^i b^i c^i, i >= 0"
tm1 = TuringMachine.new( "files/ex1.txt" )
puts "BaabbccB: #{ tm1.simulate( "BaabbccB" ) }"
puts "BaabbccB: #{ tm1.simulate( "BaabbbccB" ) }"

puts "---------------------------------------------"
puts "ex2 accepts the language (a | b)*"
tm2 = TuringMachine.new( "files/ex2.txt" )
puts "BabababababaaabababababababB: #{ tm2.simulate( "BabababababaaabababababababB" ) }"
puts "BabababababaaabcababababababB: #{ tm2.simulate( "BabababababaaabcababababababB" ) }"

puts "---------------------------------------------"
puts "ex3 accepts the language aa (a | b)*"
tm3 = TuringMachine.new( "files/ex3.txt" )
puts "BaabbababababbbbB: #{ tm3.simulate( "BaabbababababbbbB" ) }"
puts "BabbbbabaB: #{ tm3.simulate( "BabbbbabaB" ) }"

