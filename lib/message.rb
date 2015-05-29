module SmsMock
  class Message
    attr_accessor :number, :body, :from
    
    def initialize(opts={})
      @number = opts[:number]
      @body = opts[:body]
      @from = opts[:from]
    end
  end
end