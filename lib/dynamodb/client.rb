require "dynamodb/client/version"
require "aws-sdk"

module DynamoDB
  module Client
    def dynamodb_client
      DynamoDB::Client.instance
    end

    def self.instance
      endpoint_override = ENV['AWS_DYNAMODB_ENDPOINT']
      config = {}
      config.merge!(endpoint: endpoint_override) if endpoint_override

      Aws::DynamoDB::Client.new(config)
    end
  end
end
