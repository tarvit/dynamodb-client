require 'spec_helper'

describe Dynamodb::Client do
  it 'has a version number' do
    expect(Dynamodb::Client::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
