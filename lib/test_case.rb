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
    "result file from path: #{path}"
  end

  def activate
    file = fetch_file(@path)
    process(line_length(file))
    process(trailing_white_space(file))
    process(new_line(file))
    process(semi_colon(file))
    process(space_operator(file))
    process(space_braces(file))
    process(space_after_bang(file))
    process(line_between_methods(file))
    process(several_lines(file))
    process(empty_accessor(file))
    process(space_equals(file))
    process(snake_case(file))
    process(camel_case(file))
    process(one_class(file))
  end

  def process(arr)
    @error_counter += arr.size
    arr.each { |v| @errors << v }
  end
end
