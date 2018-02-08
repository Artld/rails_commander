# General application help
class Command::Help
  include Command::Common

  def help
    files = Dir['lib/command/*.rb']
    commands = files.map { |f| f.split('/').last.gsub('.rb', '') }.join "\n  "

    @sender.send_text "Usage: COMMAND [OPTIONS]\n"\
                      "Type COMMAND without arguments to show details.\n"\
                      "Available commands:\n"\
                      "  #{commands}"
  end
end
