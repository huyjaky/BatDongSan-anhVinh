const express = require('express');
const controllerAPI = require('../controllers/controllerAPI');

let router = express.Router();

let initRouter = (app) => {
  router.post('/api/login', controllerAPI.handleLogin);

  // check email exist
  // compare password
  // return userinfor
  // access_token: JWT
  return app.use('/', router);
}

module.exports = initRouter;