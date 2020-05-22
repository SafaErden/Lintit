require "one_class"
require 'tempfile'

describe "TestCase" do
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }
end