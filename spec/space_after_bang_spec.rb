require_relative 'several_lines'
require_relative 'tempfile'

describe 'SpaceAfterBang' do
  let(:dummy_content) { ['a!        '] }
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }

  describe '#space_after_bang' do
    it 'should accept three arguments' do
      test_case.space_after_bang(dummy_content, false, [])
    end
    it 'should return the indentation errors and file content in an array' do
      expect(test_case.space_after_bang(dummy_content, false, [])).to be_a(Array)
    end
    it 'should return fixed content as the second element of the array if fix is true' do
      expect(test_case.space_after_bang(dummy_content, true, [])[1]).to eql(['a!'])
    end
  end
end
