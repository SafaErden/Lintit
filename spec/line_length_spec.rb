require_relative 'line_length'
require 'tempfile'

describe 'LineLength' do
  let(:dummy_content) { ['end', 'def sortit'] }
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }

  describe '#line_length' do
    it 'should accept one argument' do
      test_case.line_length(dummy_content)
    end
    it 'should return the indentation errors and file content in an array' do
      expect(test_case.line_length(dummy_content)).to be_a(Array)
    end
  end
end
