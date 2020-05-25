require_relative '../lib/one_class'

describe 'OneClass' do
  let(:dummy_content) { ['end', 'def sortit'] }
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }

  describe '#one_class' do
    it 'should accept one argument' do
      test_case.one_class(dummy_content)
    end
    it 'should return the indentation errors and file content in an array' do
      expect(test_case.one_class(dummy_content)).to be_a(Array)
    end
  end
end
