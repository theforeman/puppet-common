require 'spec_helper'

describe 'generate_password' do
  it { is_expected.not_to eq(nil) }

  it 'generates a password' do
    result = subject.call([])
    expect(result).to be_an_instance_of(String)
    expect(result.length).to be(32)
  end
end

