const path = require('path');

let getImage = async (req, res) => {
  try {
    const imagePath = path.join(__dirname, '../../', req.params[0] ); // đường dẫn tới file ảnh
    // return res.json(req.params[0]);
    return res.sendFile(imagePath);
  } catch (error) {
    console.log(error);
    return res.json(error);
  }
}

module.exports = {
  getImage: getImage
}