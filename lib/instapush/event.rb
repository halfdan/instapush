module Instapush
  class Event
    def initialize(name)
      @name = name
      @tracker = Hash.new
    end

    def name
      @name
    end

    def tracker=(hash)
      @tracker = hash
    end

    def tracker
      @tracker
    end
  end
end
