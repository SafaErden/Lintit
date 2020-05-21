#!/usr/bin/env ruby
require 'colorize'
require './lib/test_case.rb'

if ARGV[0]!=nil
  path = ARGV[0]
  test_case = TestCase.new(path) 
  test_case.activate

  error_size = test_case.error_counter
  error_array = test_case.errors

  error_array.each do |v|
    v.each_with_index do |val, i|
      print "#{val}: ".blue if i == 0
      puts val.to_s.yellow if i == 1
      puts val if i == 2
    end
  end
  puts "#{test_case.path} examined".yellow
  puts "#{error_size} errors found".red
end
