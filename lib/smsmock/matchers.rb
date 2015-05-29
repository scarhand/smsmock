module SmsMock
  module Matchers
    RSpec::Matchers.define :have_body do |body|
      match do |message|
        message.body == body
      end
    end

    RSpec::Matchers.define :be_sent_from do |from|
      match do |message|
        message.from == from
      end
    end

    RSpec::Matchers.define :be_sent_to do |to|
      match do |message|
        message.to == to
      end
    end

    RSpec::Matchers.define :have_sent_messages do |size|
      match do |client|
        if !size.nil?
          client.messages.size == size
        else
          !client.messages.empty?
        end
      end
    end

    RSpec::Matchers.define :have_sent_message_to do |to|
      match do |client|
        !(client.messages.find { |message| message.to == to } ).nil?
      end
    end

    RSpec::Matchers.define :have_sent_message_from do |from|
      match do |client|
        !(client.messages.find { |message| message.from == from } ).nil?
      end
    end

    RSpec::Matchers.define :have_sent_message_with_body do |body|
      match do |client|
        !(client.messages.find { |message| message.body == body } ).nil?
      end
    end
  end
end
