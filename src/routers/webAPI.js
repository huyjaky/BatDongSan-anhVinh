const express = require('express');
const controllerAPI = require('../controllers/controllerAPI');
const multer = require('multer');
const storage = require('../config/DiskMem');
const handleLogin = require('../controllers/handleLogin');
const handlePostKhach = require('../controllers/handlePostKhach');
const handleGetKhach = require('../controllers/handleGetKhach');
const getImg = require('../controllers/getImg');
const handleRemoveKhach = require('../controllers/handleRemoveKhach');
const handleChangeVal = require('../controllers/handleChangeVal');


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
  router.post('/api/login', handleLogin.handleLogin);
  // router.post('/api/img', upload.array('files'), controllerAPI.handleImage);
  router.get('/api/phuongquan', controllerAPI.getPhuongQuan);
  router.post('/api/khach', upload.array('files'), handlePostKhach.postKhach);
  router.post('/api/img', upload.array('files'), handlePostKhach.upImg);
  router.get('/api/getallkhach', handleGetKhach.getAllKhach);
  router.get('/api/img/path/*', getImg.getImage);

  router.post('/api/remove/khach', handleRemoveKhach.RemoveKhach);
  router.post('/api/change/khach', handleChangeVal.handleChangeVal);
  router.post('/api/change/img', upload.array('files'), handleChangeVal.upImg);

  return app.use('/', router);
}

module.exports = initRouter;