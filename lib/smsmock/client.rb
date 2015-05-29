module SmsMock
  class Client
    def Client.messages
      @@messages ||= []
    end

    def Client.messages=(val)
      @@messages = val
    end
  end
end