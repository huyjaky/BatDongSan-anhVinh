const e = require("cors");
const userServices = require("../services/userServices");

let handleLogin = async (req, res) => {
  let TaiKhoan = req.body.TaiKhoan;
  let MatKhau = req.body.MatKhau;
  if (!TaiKhoan || !MatKhau) {
    return res.status(500).json({
      errCode: 1,
      messsage: 'Missing a parameters'
    })
  } else {
    
    let userData = await userServices.handleUserLogin(TaiKhoan, MatKhau);
    return res.json(userData);
  }
}

let handleImage = async (req, res) => {
  let codeImg = req.body;
  let codeImg2 = req.query;
  console.log(codeImg, 'check1');
  console.log(codeImg2, 'check2');
}

module.exports = {
  handleLogin: handleLogin,
  handleImage: handleImage
}