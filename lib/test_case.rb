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
    self.process(line_length?(file))
  end

  def process(arr)
    @error_counter+=arr.size
    arr.each{|v| @errors << v}
  end

end