require './lib/cases.rb'

class TestCase
  include Cases

  attr_accessor :errors
  attr_reader :path, :error_counter

  def initialize(path)
    @path = path
    @errors = []
    @error_counter = 0
  end

  def fetch_file(path)
    file = File.open(path)
    file_data=file.readlines.map(&:chomp)
    file.close
    file_data
  end

  def activate
    file = fetch_file(@path)
    process(indentation(file))
    process(line_length(file))
    process(trailing_white_space(file))
    process(semi_colon(file))
    process(space_braces(file))
    process(space_after_bang(file))
    process(line_between_methods(file))
    process(several_lines(file))
    process(one_class(file))
  end

  def process(arr)
    @error_counter += arr.size
    arr.each { |v| @errors << v }
  end
end
