module Command
  module Common
    def initialize(user, sender, options)
      @user = user
      @sender = sender
      @options = options
    end

    def perform
    end
  end
end
