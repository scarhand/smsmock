require File.expand_path('spec_helper.rb', File.dirname(__FILE__))

describe SmsMock do

  before :each do
    @client = Twilio::REST::Client.new('','')
    SmsMock::Client.messages.clear
  end

  it 'add a message to SmsMock::Client' do
    @client.messages.create(to: '123456', body: 'abc123', from: '654312')
    expect(SmsMock::Client).to have_sent_messages
    expect(SmsMock::Client.messages.last).to have_body 'abc123'
    expect(SmsMock::Client.messages.last).to be_sent_from '654312'
    expect(SmsMock::Client.messages.last).to be_sent_to '123456'
  end

  it 'adds multiple messages to SmsMock::Client' do
    expect(SmsMock::Client).to have_sent_messages(0)
    @client.messages.create(to: '123456', body: 'abc123', from: '654321')
    @client.messages.create(to: '567890', body: 'abc567', from: '098765')
    expect(SmsMock::Client).to have_sent_message_to '123456'
    expect(SmsMock::Client).to have_sent_messages(2)
  end
end
