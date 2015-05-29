module Twilio
  module REST
    class Messages < ListResource
      include SmsMock::Helpers
      def initialize(*args)
      end

      def create(opts={})
        add_message SmsMock::Message.new opts
      end
    end
  end
end
