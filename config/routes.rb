Rails.application.routes.draw do
  post "/webhooks/telegram_#{Rails.application.secrets.webhook_token}" => 'webhooks#callback'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
