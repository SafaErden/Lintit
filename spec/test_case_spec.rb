require_relative '../lib/test_case'
require 'tempfile'

describe 'TestCase' do
  let(:temp_file) { Tempfile.create { |f| f << "abc\n" } }
  let(:test_case) { TestCase.new(temp_file) }

  describe '#initialize' do
    it 'should accept a file path as string ' do
      test_case
    end

    it 'should set @path to a given argument' do
      expect(test_case.instance_variable_get(:@path)).to eql(temp_file)
    end

    it 'should set @errors to an empty array' do
      expect(test_case.instance_variable_get(:@errors)).to eql([])
    end

    it 'should set @error_counter to zero' do
      expect(test_case.instance_variable_get(:@error_counter)).to eql(0)
    end

    it 'should set @fix_counter to zero' do
      expect(test_case.instance_variable_get(:@fix_counter)).to eql(0)
    end
  end

  describe '#path' do
    it 'should get (return) @path' do
      expect(test_case.path).to be(test_case.instance_variable_get(:@path))
    end
  end

  describe '#error_counter' do
    it 'should get (return) @error_counter' do
      expect(test_case.error_counter).to be(test_case.instance_variable_get(:@error_counter))
    end
  end

  describe '#fix_counter' do
    it 'should get (return) @fix_counter' do
      expect(test_case.fix_counter).to be(test_case.instance_variable_get(:@fix_counter))
    end
  end

  describe '#errors' do
    it 'should get (return) @fix_counter' do
      expect(test_case.errors).to be(test_case.instance_variable_get(:@errors))
    end
  end

  describe '#fetch_file' do
    it 'should return the content of the given path file' do
      allow(test_case).to receive(:fetch_file).and_return('content')
      expect(test_case.fetch_file(temp_file)).to eq('content')
    end
  end

  describe '#fix_file' do
    it 'should accept two arguments' do
      expect { test_case.fix_file(temp_file, 'new_content') }.to_not raise_error
    end
    it 'should replace the old content with the fixed content' do
      expect { test_case.fix_file(temp_file, 'new_content') }.to_not raise_error
      expect(test_case.fetch_file(temp_file)).to eq(['new_content'])
    end
  end

  describe '#activate' do
    it 'should call TestCase#fetch_file' do
      expect(test_case).to receive(:fetch_file)
      test_case.activate
    end
  end

  describe '#process' do
    it 'should increment @error_counter' do
      test_case.instance_variable_set(:@error_counter, 5)
      test_case.process([['a'], ['file_content']], false)
      expect(test_case.error_counter).to eq(6)
    end
    it 'should increment @fix_counter' do
      test_case.instance_variable_set(:@fix_counter, 5)
      test_case.process([['a'], ['file_content']], true)
      expect(test_case.fix_counter).to eq(6)
    end
    it 'should update @errors' do
      test_case.instance_variable_set(:@errors, ['a'])
      test_case.process([['a'], ['file_content']], true)
      expect(test_case.errors).to eq(%w[a a])
    end
  end
end
