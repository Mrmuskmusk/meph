const TelegramBot = require('node-telegram-bot-api');

// replace the value below with the Telegram token you receive from @BotFather
const token = '7142615915:AAEbK7yRGnxZ18y4UTBI8izH4dzeI6xNjpQ';

// Create a bot instance
const bot = new TelegramBot(token);

// Define the chat ID and message to be sent
const chatId = '6502945541';  // Replace with the target chat ID
const message = 'Hello from your bot!';

// Send the message
bot.sendMessage(chatId, message).then(() => {
  console.log('Message sent successfully');
}).catch((error) => {
  console.error('Error sending message:', error);
});
