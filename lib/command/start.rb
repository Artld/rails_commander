class Command::Start
  include Command::Common

  def perform
    @sender.send_text "Welcome, #{@user.first_name} #{@user.last_name}!"
    Command::Help.new(@user, @sender, @options).perform
  end
end
