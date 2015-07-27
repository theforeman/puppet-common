require 'spec_helper'

describe 'validate_present' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params('').and_raise_error(Puppet::ParseError, /must be present/) }
  it { is_expected.to run.with_params('something').and_return(true) }
end

