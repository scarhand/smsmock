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

    RSpec::Matchers.define :have_messages do |size|
      match do |client|
        if !size.nil?
          client.messages.size == size
        else
          !client.messages.empty?
        end
      end
    end
  end
end