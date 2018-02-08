class CommandFactory
  def build(user, chat, text)
    sender = BotSender.new chat
    args = text.split
    command = args[0].delete '/'
    begin
      the_class = Object.const_get "Command::#{command.capitalize}"
    rescue NameError
      sender.send_text "unknown command #{command}"
    end
    instance = the_class.new(user, sender)
    options = args[1, -1]
    if options.nil?
      instance.help
    else
      instance.perform options
    end
  end
end
