require './lib/cases.rb'

class TestCase
    include Cases

    attr_accessor :errors
    attr_reader :path, :error_counter

    def initialize(path)
      @path=path
      @errors=[]
      @error_counter=0
    end

    
  def fetch_file(path)
    return "result file from path: #{path}"
  end

  def activate
    file=self.fetch_file(@path)
    self.process(line_length(file))
    self.process(trailing_white_space(file))
    self.process(new_line(file))
    self.process(semi_colon(file))
    self.process(space_operator(file))
    self.process(space_braces(file))
    self.process(space_after_bang(file))
    self.process(line_between_methods(file))
    self.process(several_lines(file))
    self.process(empty_accessor(file))
    self.process(space_equals(file))
    self.process(snake_case(file))
    self.process(camel_case(file))
    self.process(one_class(file))
  end

  def process(arr)
    @error_counter+=arr.size
    arr.each{|v| @errors << v}
  end

end