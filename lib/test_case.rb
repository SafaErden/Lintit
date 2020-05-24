require_relative  'indentation'
require_relative  'line_length'
require_relative  'white_space'
require_relative  'semi_colon'
require_relative  'space_braces'
require_relative  'space_after_bang'
require_relative  'line_between_methods'
require_relative  'several_lines'
require_relative  'one_class'

class TestCase
  include Indentation
  include LineLength
  include WhiteSpace
  include SemiColon
  include SpaceBraces
  include SpaceAfterBang
  include LineBetweenMethods
  include SeveralLines
  include OneClass

  attr_reader :path, :error_counter, :fix_counter, :errors

  def initialize(path)
    @path = path
    @errors = []
    @error_counter = 0
    @fix_counter = 0
  end

  def fetch_file(path)
    file = File.open(path)
    file_data = file.readlines.map(&:chomp)
    file.close
    file_data
  rescue StandardError
    puts '............................................'
    puts
    puts "I am sorry, I couldn't find the file. Consider that I am a dummy linter, not Google!".blue
    puts 'So please give me a valid directory and filename that I can easily find.'.blue
    puts '............................................'
    exit
  end

  def fix_file(path, data)
    File.open(path, 'w') { |file| file.puts data }
  end

  def activate(fix = false)
    file = fetch_file(@path)
    return if file.nil?

    file = process(indentation(file, fix), fix)
    file = process(line_length(file), false)
    file = process(trailing_white_space(file, fix), fix)
    file = process(semi_colon(file, fix), fix)
    file = process(space_braces(file, fix), fix)
    file = process(space_after_bang(file, fix), fix)
    file = process(line_between_methods(file, fix), fix)
    file = process(several_lines(file, fix), fix)
    file = process(one_class(file), false)
    fix_file(@path, file)
  end

  def process(arr, fix)
    @error_counter += arr[0].size
    @fix_counter += arr[0].size if fix
    arr[0].each_with_index { |v, _i| @errors << v }
    arr[-1]
  end
end
