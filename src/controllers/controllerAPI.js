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
  // console.log(req.file);
}

let getPhuongQuan = async (req, res) => {
  let quan = await userServices.getQuan();
  let phuong = await  userServices.getPhuong();
  let phuongquan = await userServices.getPhuongQuan();
  return res.json({
    quan: quan,
    phuong: phuong,
    phuongquan: phuongquan
  });
}

module.exports = {
  handleLogin: handleLogin,
  handleImage: handleImage,
  getPhuongQuan: getPhuongQuan
}