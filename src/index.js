const express = require('express');
const bodyParser = require('body-parser');
const viewEngine = require('./config/viewEngine');
const router = require('./routers/webAPI');
const cors = require('cors');
require('dotenv').config();
const https = require('https');
const fs = require('fs');

let app = express();
app.use(cors());

// config app

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

viewEngine(app);
router(app);

const option = {
  key: fs.readFileSync('I://newjava//JavaScript//BatDongSan//back-end//src//server_key.key'),
  cert: fs.readFileSync('I://newjava//JavaScript//BatDongSan//back-end//src//server.crt')
}

const server = https.createServer(option, app);

let port = process.env.PORT || 8080;
server.listen(port, () => {
  console.log('Server listening on port ', port);
});
