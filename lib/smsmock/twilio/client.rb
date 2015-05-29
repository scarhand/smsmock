module Twilio
  module REST
    class Client
      def initialize(account_sid, auth_token)
        @account_sid = account_sid
        @auth_token = auth_token
      end

      def account
        @account ||= Account.new
      end
    end

    class Account
      def initialize
      end

      def sms
        @sms ||= Sms.new
      end
    end

    class Sms
      def initialize
      end

      def messages
        @messages ||= Messages.new
      end
    end

    class Messages
      include SmsMock::Helpers
      def initialize
      end

      def create(opts={})
        add_message SmsMock::Message.new opts
      end
    end
  end
end
