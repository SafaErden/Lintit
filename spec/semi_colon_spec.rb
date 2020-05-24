require_relative '../lib/semi_colon'

describe 'SemiColon' do
  let(:dummy_content) { ['i=2;'] }
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }

  describe '#semi_colon' do
    it 'should accept three arguments' do
      test_case.semi_colon(dummy_content, false, [])
    end
    it 'should return the indentation errors and file content in an array' do
      expect(test_case.semi_colon(dummy_content, false, [])).to be_a(Array)
    end
    it 'should return fixed content as the second element of the array if fix is true' do
      expect(test_case.semi_colon(dummy_content, true, [])[1]).to eql(['i=2'])
    end
  end
end
