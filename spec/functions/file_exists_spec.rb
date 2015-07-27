require 'spec_helper'

describe 'file_exists' do
  it { is_expected.not_to eq(nil) }

  context 'when a file does not exist' do
    let(:filename) { '/tmp/nothing_to_see_here' }

    before do
      File.expects(:exists?).with(filename).returns(false).once
    end

    it { is_expected.to run.with_params(filename).and_return(false) }
  end

  context 'when a file exists' do
    let(:filename) { '/tmp/important_file' }

    before do
      File.expects(:exists?).with(filename).returns(true).once
    end

    it { is_expected.to run.with_params(filename).and_return(true) }
  end
end

