class CommandChooser
  def start(user, chat, text)
    sender = BotSender.new chat
    args = text.split
    command = args[0]
    begin
      the_class = Command.const_get command
    rescue NameError => e
      sender.send_text "unknown command #{command}"
    end
    the_class.new(user, sender).parse(args[1, -1])
  end
end
