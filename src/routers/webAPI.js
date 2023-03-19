const express = require('express');
const controllerAPI = require('../controllers/controllerAPI');

let router = express.Router();

let initRouter = (app) => {
  router.get('/', controllerAPI.getHomepage);

  return app.use('/', router);
}

module.exports = initRouter;