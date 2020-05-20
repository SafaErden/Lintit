#!/usr/bin/env ruby
require 'colorize'
require './lib/test_case.rb'

path=ARGV[0]
test_case=TestCase.new(path)
test_case.activate

error_size=test_case.error_counter
error_array=test_case.errors


error_array.each do |v| 
  v.each_with_index do |val,i| 
    print "#{val}: ".blue if i==0
    puts "#{val}".yellow if i==1
    puts "  #{val}".red if i==2
  end 
end
puts "#{test_case.path} examined".yellow
puts "#{error_size} errors found".red