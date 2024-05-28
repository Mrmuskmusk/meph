import TelegramBot from 'node-telegram-bot-api';

// replace the value below with the Telegram token you receive from @BotFather
const token: string = '';

// Create a bot instance
const bot: TelegramBot = new TelegramBot(token);

// Define the chat ID and message to be sent
const chatId: string = '';  // Replace with the target chat ID
const message: string = 'Hello from your bot!';

// Send the message
bot.sendMessage(chatId, message).then(() => {
  console.log('Message sent successfully');
}).catch((error) => {
  console.error('Error sending message:', error);
});
