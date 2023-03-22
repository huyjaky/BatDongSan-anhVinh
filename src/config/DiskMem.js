const multer = require('multer');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/private/img')
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname)
  }
})

module.exports = storage;