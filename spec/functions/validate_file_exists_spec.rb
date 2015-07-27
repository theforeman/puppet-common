require 'spec_helper'

describe 'validate_file_exists' do
  it { is_expected.not_to eq(nil) }
  let(:filename) { '/tmp/nothing_to_see_here' }

  context 'when a file does not exist' do
    before { File.expects(:exists?).with(filename).returns(false).once }
    it { is_expected.to run.with_params(filename).and_raise_error(Puppet::ParseError, /not exist/) }
  end

  context 'when a file exists' do
    before { File.expects(:exists?).with(filename).returns(true).once }
    it { is_expected.to run.with_params(filename).and_return(true) }
  end
end

