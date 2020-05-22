# !/usr/bin/env ruby
require 'colorize'
require './lib/test_case.rb'

unless ARGV[0].nil?
  path = ARGV[0]
  puts path
  test_case = TestCase.new(path)
  ARGV[1] == 'fix' ? test_case.activate(true) : test_case.activate(false)

  test_case.errors.each do |v|
    v.each_with_index do |val, i|
      print "#{val}: ".blue if i.zero?
      print '[Corrected] '.green if i == 1 && val == true
      puts val.to_s.yellow if i == 2
      puts val if i == 3
    end
  end
  puts "#{test_case.path} examined".yellow
  puts "#{test_case.error_counter} errors found".red
  puts "#{test_case.fix_counter} errors fixed".green if ARGV[1] == 'fix'
end
