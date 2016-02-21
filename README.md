[![Gem Version](https://badge.fury.io/rb/dynamodb-client.svg)](https://badge.fury.io/rb/dynamodb-client)
# DynamoDB::Client

A simple DynamoDB client module that allows you to override the endpoint using
an environment variable.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dynamodb-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dynamodb-client

## Usage

Once the gem is included in your project. Ensure that you have the below
environment variables set:

```bash
  AWS_ACCESS_KEY_ID=development
  AWS_SECRET_ACCESS_KEY=development
  AWS_REGION=us-east-1
  AWS_DYNAMODB_ENDPOINT=http://locahost:8000
```

By default, the amazon SDK provides `AWS_ACCESS_KEY_ID`,
`AWS_SECRET_ACCESS_KEY` and `AWS_REGION` but their SDK does not allow you to
override the endpoint, this little gem lets you set the endpoint.

In your code you have 3 options:

```ruby
require 'dynamodb/client'

class MyClass
  include DynamoDB::Client

  def my_method
    dynamodb_client.list_tables
  end
end
```

```ruby
require 'dynamodb/client'

class MyClass
  extend DynamoDB::Client

  def self.my_method
    dynamodb_client.list_tables
  end
end
```

```ruby
require 'dynamodb/client'

class MyClass
  def my_method
    DynamoDB::Client.instance.list_tables
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/henrylawson/dynamodb-client. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

