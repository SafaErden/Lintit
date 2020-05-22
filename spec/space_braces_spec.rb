require "space_braces"
require 'tempfile'

describe "SpaceBraces" do
  let(:dummy_content) { ["( {}   ]"] }
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }

  describe "#space_braces" do
      it "should accept three arguments" do
        test_case.space_braces(dummy_content, false, [])
      end
      it "should return the indentation errors and file content in an array" do
        expect(test_case.space_braces(dummy_content, false, [])).to be_a(Array)
      end
      it "should return fixed content as the second element of the array if fix is true" do
        expect(test_case.space_braces(dummy_content, true, [])[1]).to eql( ["({ }]"] )
      end
  end
end