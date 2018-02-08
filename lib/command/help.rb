class Command::Help
  include Command::Common

  def perform
    @sender.send_text 'This is my help'
  end
end
