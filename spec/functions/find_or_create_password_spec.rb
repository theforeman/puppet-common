require 'spec_helper'
require 'tmpdir'

describe 'find_or_create_password' do
  it { is_expected.not_to eq(nil) }

  context 'when a file exists' do
    let(:filename) { "#{Dir.mktmpdir}/super_secret" }
    let(:password) { 'super_secret_password' }

    before do
      File.open(filename, 'w') { |f| f.write(password) }
    end

    it { is_expected.to run.with_params(filename).and_return(password) }
  end

  context 'when a file does not exist' do
    let(:filename) { "#{Dir.mktmpdir}/does_not_exist_yet" }

    it 'creates a file and generates a password' do
      result = subject.call([filename])
      expect(result).to be_an_instance_of(String)
      expect(result.length).to be(32)
      expect File.exists?(filename)
    end
  end
end

