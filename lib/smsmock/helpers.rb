module SmsMock
  module Helpers
    def add_message(message)
      Client.messages << message
    end
  end
end
