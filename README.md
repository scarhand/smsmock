# SmsMock

Adds [twilio-ruby](https://github.com/twilio/twilio-ruby) RSpec test for testing SMS interactions.

##Setup
Add the smsmock gem to your Gemfile:
<pre>
group :test do
  gem 'smsmock'
end
</pre>

## RSpec
In your spec_helper.rb file require the smsmocker.

<pre>
require 'smsmock'
</pre>

## Example
<pre>
require 'spec_helper'

describe SmsMock do

  before :each do
    @client = Twilio::REST::Client.new('','')
  end

  it 'add a message to SmsMock::Client' do
    @client.messages.create(to: '123981', body: 'abc123', from: '1291')
    expect(SmsMock::Client).to have_messages
    expect(SmsMock::Client.messages.last).to have_body 'abc123'
    expect(SmsMock::Client.messages.last).to be_sent_from '1291'
    expect(SmsMock::Client.messages.last).to be_sent_to '123981'
  end
end
</pre>