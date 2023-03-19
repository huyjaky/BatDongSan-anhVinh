const express = require('express');
const bodyParser = require('body-parser');
const viewEngine = require('./config/viewEngine');
const router = require('./routers/webAPI');
const cors = require('cors');
require('dotenv').config();

let app = express();
app.use(cors());

// config app

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

viewEngine(app);
router(app);

let port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log('Connected!', port);
});
