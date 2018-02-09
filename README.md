## README

To run this application:

1. Run `bundle install`, write your database configuration in *config/database.yml*, run `rake db:create db:migrate`

2. Create bot using BotFather in Telegram. Set webhook to your server with query:

   `https://api.telegram.org/bot<BOT_TOKEN>/setWebhook?url=<your_https_url>/webhooks/telegram_<WEBHOOK_TOKEN>`

   `BOT_TOKEN` - telegram bot token from BotFather, `WEBHOOK_TOKEN` - some big random token

   If you have not https on your server/computer, use ngrok:

   `ngrok http 3000`

3. Run application with variables like that:

   `WEBHOOK_TOKEN=<WEBHOOK_TOKEN> BOT_TOKEN=<BOT_TOKEN> rails s`

4. Extend functionality by adding your classes to *lib/command/*
