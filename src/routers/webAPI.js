const express = require('express');
const controllerAPI = require('../controllers/controllerAPI');

let router = express.Router();

let initRouter = (app) => {
  router.post('/api/login', controllerAPI.handleLogin);
  router.post('/api/img', controllerAPI.handleImage);


  return app.use('/', router);
}

module.exports = initRouter;