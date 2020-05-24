require_relative '../lib/white_space'
require 'tempfile'

describe 'WhiteSpace' do
  let(:dummy_content) { ['a   b c   d  e   f   g         h'] }
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }

  describe '#trailing_white_space' do
    it 'should accept three arguments' do
      test_case.trailing_white_space(dummy_content, false, [])
    end
    it 'should return the indentation errors and file content in an array' do
      expect(test_case.trailing_white_space(dummy_content, false, [])).to be_a(Array)
    end
    it 'should return fixed content as the second element of the array if fix is true' do
      expect(test_case.trailing_white_space(dummy_content, true, [])[1]).to eql(['a b c d e f g h'])
    end
  end
end
