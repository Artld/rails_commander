class Command::Help
  include Command::Common

  def perform
    #classes = Command.constants.select { |c| Command.const_get(c).is_a? Class }
    #commands = classes.map { |c| c.to_s.downcase }.join "\n"

    files = Dir['lib/command/*.rb']
    commands = files.map { |f| f.split('/').last.gsub('.rb', '') }.join "\n"

    @sender.send_text "Usage: COMMAND [OPTIONS]\n"\
                      "Available commands:\n"\
                      "#{commands}"
  end
end
