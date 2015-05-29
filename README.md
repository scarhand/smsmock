# SmsMock

Adds [twilio-ruby](https://github.com/twilio/twilio-ruby) RSpec tests for testing SMS interactions.

##Setup
Add the smsmock gem to your Gemfile:
```ruby
group :test do
  gem 'smsmock'
end
```

## RSpec
In your spec_helper.rb file require the smsmocker.

```ruby
require 'smsmock'
```

## Example
```ruby
require 'spec_helper'

describe SmsMock do

  before :each do
    @client = Twilio::REST::Client.new('','')
  end

  it 'add a message to SmsMock::Client' do
    @client.messages.create(to: '123981', body: 'abc123', from: '1291')
    expect(SmsMock::Client).to have_sent_messages
    expect(SmsMock::Client.messages.last).to have_body 'abc123'
    expect(SmsMock::Client.messages.last).to be_sent_from '1291'
    expect(SmsMock::Client.messages.last).to be_sent_to '123981'
  end
end
```

The following matchers can be used:
```ruby
  # for SmsMock::Client
  expect(SmsMock::Client).to have_sent_messages
  expect(SmsMock::Client).to have_sent_messages 2
  expect(SmsMock::Client).to have_sent_message_to '123456'
  expect(SmsMock::Client).to have_sent_message_from '123456'
  expect(SmsMock::Client).to have_sent_message_with_body 'abc123'

  # with chaining:
  expect(SmsMock::Client).to have_sent_message_to('123456').and from('654321').and with_body('abc123')

  # for individual messages
  expect(SmsMock::Client.messages.last).to have_body 'abc123'
  expect(SmsMock::Client.messages.last).to be_sent_from '1291'
  expect(SmsMock::Client.messages.last).to be_sent_to '123981'

  # with chaining:
  expect(SmsMock::Client.messages.last).to be_sent_to('123456').and from('654321').and with_body('abc123')
```