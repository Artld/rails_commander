# Usually the first command which user executes (by sending "/start" to bot)
class Command::Start
  include Command::Common

  def help
    @sender.send_text "Welcome, #{@user.first_name} #{@user.last_name}!"
    Command::Help.new(@user, @sender).help
  end
end
