class CommandChooser
  def start(user, chat, text)
    sender = BotSender.new chat
    args = text.split
    command = args[0].gsub('/', '')
    begin
      the_class = Object.const_get "Command::#{command.capitalize}"
    rescue NameError
      sender.send_text "unknown command #{command}"
    end
    the_class.new(user, sender, args[1, -1]).perform
  end
end
