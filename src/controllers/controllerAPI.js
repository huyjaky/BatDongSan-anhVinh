const e = require("cors");
const userServices = require("../services/userServices");

let handleLogin = async (req, res) => {
  let TenNhanVien = req.body.TenNhanVien;
  let MatKhau = req.body.MatKhau;
  if (!TenNhanVien || !MatKhau) {
    return res.status(500).json({
      errCode: 1,
      messsage: 'Missing a parameters'
    })
  } else {
    // check email
    // compare password
    let userData = await userServices.handleUserLogin(TenNhanVien, MatKhau);
    return res.json(userData);
  }
}


module.exports = {
  handleLogin: handleLogin
}