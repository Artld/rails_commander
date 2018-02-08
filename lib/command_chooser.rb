class CommandChooser
  def start(user, chat, text)
    sender = BotSender.new chat
    args = text.split
    c = args[0]
    command = c.start_with?('/') ? c[1, -1] : c
    begin
      the_class = Object.const_get "Command::#{command}"
    rescue NameError
      sender.send_text "unknown command #{command}"
    end
    the_class.new(user, sender, args[1, -1]).perform
  end
end
