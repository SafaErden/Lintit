require_relative 'line_between_methods'
require_relative 'tempfile'

describe 'LineBetweenMethods' do
  let(:dummy_content) { ['end', 'def sortit'] }
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }

  describe '#line_between_methods' do
    it 'should accept three arguments' do
      test_case.line_between_methods(dummy_content, false, [])
    end
    it 'should return the indentation errors and file content in an array' do
      expect(test_case.line_between_methods(dummy_content, false, [])).to be_a(Array)
    end
    it 'should return fixed content as the second element of the array if fix is true' do
      expect(test_case.line_between_methods(dummy_content, true, [])[1]).to eql(['end', '', 'def sortit'])
    end
  end
end
