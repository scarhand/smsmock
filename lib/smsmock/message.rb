module SmsMock
  class Message
    attr_accessor :to, :body, :from
    
    def initialize(opts = {})
      @to = opts[:to]
      @body = opts[:body]
      @from = opts[:from]
    end
  end
end