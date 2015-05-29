require File.expand_path('spec_helper.rb', File.dirname(__FILE__))

describe SmsMock do

  before :each do
    @client = Twilio::REST::Client.new('','')
  end

  it 'add a message to SmsMock::Client' do
    @client.account.sms.messages.create(number: '123981', body: 'abc123', from: '1291')
    expect(SmsMock::Client).to have_messages
    expect(SmsMock::Client.messages.last).to have_body 'abc123'
    expect(SmsMock::Client.messages.last).to be_sent_from '1291'
    expect(SmsMock::Client.messages.last).to be_sent_to '123981'
  end
end
