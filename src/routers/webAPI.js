const express = require('express');
const controllerAPI = require('../controllers/controllerAPI');
const multer = require('multer');
const storage = require('../config/DiskMem');


const upload = multer({
  storage: storage,
  limits: {
    fileSize: 1024 * 1024 * 30, // giới hạn tải lên là 10MB
    maxFiles: 30, // giới hạn số lượng file tối đa là 20
    maxParallelUploads: 30, // tải đồng thời tối đa 10 file
  }
});

let router = express.Router();

let initRouter = (app) => {
  router.post('/api/login', controllerAPI.handleLogin);
  router.post('/api/img', upload.array('files'), controllerAPI.handleImage);
  router.get('/api/phuongquan', controllerAPI.getPhuongQuan);
  router.post('/api/khachthue', controllerAPI.postKhachThue);

  return app.use('/', router);
}

module.exports = initRouter;