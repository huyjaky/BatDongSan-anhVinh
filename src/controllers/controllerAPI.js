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
    // check email
    // compare password
    let userData = await userServices.handleUserLogin(TaiKhoan, MatKhau);
    return res.json(userData);
  }
}


module.exports = {
  handleLogin: handleLogin
}