module Command
  module Common
    def initialize(user, sender)
      @user = user
      @sender = sender
    end

    def help
    end

    def perform(_options)
    end
  end
end
