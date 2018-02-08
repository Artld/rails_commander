require 'thread'

# Parses request from Telegram bot
class WebhooksController < ApplicationController
  def callback
    Thread.new do
      CommandFactory.new.build(user, chat, text)
    end
    render nothing: true, head: :ok
  end

  private

  def message
    params['message']
  end

  def text
    message[:text]
  end

  def chat
    message[:chat][:id]
  end

  def from
    message[:from]
  end

  def user
    User.find_by(telegram_id: from[:id]) || register_user
  end

  def register_user
    u = User.find_or_initialize_by(telegram_id: from[:id])
    u.update_attributes!(username: from[:username], first_name: from[:first_name], last_name: from[:last_name])
    u
  end
end
