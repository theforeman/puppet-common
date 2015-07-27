require 'spec_helper'

describe 'subsystem_url' do
  it { is_expected.not_to eq(nil) }

  context 'with fqdn' do
    let(:facts) do
      { :fqdn => 'example.com' }
    end

    it { is_expected.to run.with_params('foo').and_return ('https://example.com/foo') }
  end

  context 'without fqdn' do
    let(:facts) do
      { :fqdn => nil }
    end

    it { is_expected.to run.with_params('foo').and_return ('https://localhost/foo') }
  end
end

