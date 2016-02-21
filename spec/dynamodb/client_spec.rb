require 'spec_helper'

class ExtendTest
  extend DynamoDB::Client
end

class IncludeTest
  include DynamoDB::Client
end

describe DynamoDB::Client do
  it 'has a version number' do
    expect(DynamoDB::Client::VERSION).not_to be nil
  end

  before do
    ENV['AWS_ACCESS_KEY_ID'] = 'development'
    ENV['AWS_SECRET_ACCESS_KEY'] = 'development'
    ENV['AWS_REGION'] = 'us-east-1'
    ENV['AWS_DYNAMODB_ENDPOINT'] = 'http://192.168.99.100:8000/'
  end

  it 'instantiates the client with extends' do
    client = ExtendTest.dynamodb_client

    expect(client.list_tables).to be
  end

  it 'instantiates the client with extends' do
    client = IncludeTest.new.dynamodb_client

    expect(client.list_tables).to be
  end

  it 'instantiates the client module function' do
    client = DynamoDB::Client.instance

    expect(client.list_tables).to be
  end
end
