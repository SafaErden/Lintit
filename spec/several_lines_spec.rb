require 'several_lines'
require 'tempfile'

describe 'SeveralLines' do
  let(:dummy_content) { ['a', '', '', '', '', '', 'b'] }
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }

  describe '#several_lines' do
    it 'should accept three arguments' do
      test_case.several_lines(dummy_content, false, [])
    end
    it 'should return the indentation errors and file content in an array' do
      expect(test_case.several_lines(dummy_content, false, [])).to be_a(Array)
    end
    it 'should return fixed content as the second element of the array if fix is true' do
      expect(test_case.several_lines(dummy_content, true, [])[1]).to eql(['a', '', 'b'])
    end
  end
end
