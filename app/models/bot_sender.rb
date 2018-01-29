require 'telegram/bot'

# Sends something to Telegram
class BotSender
  def initialize(chat = Rails.application.secrets.dev_chat)
    @chat = chat
    token = Rails.application.secrets.bot_token
    @api = ::Telegram::Bot::Api.new token
  end

  def send_text(text)
    loop do
      message = crop text
      send_message message
      text = text[message.length..-1]
      break if text.empty?
      sleep 0.5
    end
  rescue Telegram::Bot::Exceptions::ResponseError => e
    send_error e
  end

  def send_photo(photo)
    @api.call('sendPhoto', chat_id: @chat, photo: photo)
  rescue Telegram::Bot::Exceptions::ResponseError => e
    send_error e
  end

  def send_error(e)
    message = "Error #{e.error_code}: #{e.message}"
    send_message message if @chat.present?
  end

  private

  def send_message(message)
    @api.call('sendMessage', chat_id: @chat, text: message)
  end

  MAX_LENGTH = 4096 # maximum message length for Telegram

  def crop(text)
    if text.length > MAX_LENGTH
      t = text[0, MAX_LENGTH]
      if t.include? "\n"
        t.rpartition("\n").first
      elsif t.include? ' '
        t.rpartition(' ').first
      else
        t
      end
    else
      text
    end
  end
end
