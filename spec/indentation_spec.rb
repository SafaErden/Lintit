require_relative '../lib/line_between_methods'
require 'tempfile'

describe 'Indentation' do
  let(:dummy_content) { ['b', "\n", '             a'] }
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }

  describe '#indentation' do
    it 'should accept three arguments' do
      test_case.indentation(dummy_content, false, [])
    end
    it 'should return the indentation errors and file content in an array' do
      expect(test_case.indentation(dummy_content, false, [])).to be_a(Array)
    end
    it 'should return fixed content as the second element of the array if fix is true' do
      expect(test_case.indentation(dummy_content, true, [])[1]).to eql(['b', "\n", '  a'])
    end
  end
end
