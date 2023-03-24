const e = require("cors");
const userServices = require("../services/userServices");
const phuong_quan = require('../services/phuong_quan');
const post_khach = require("../services/post_khach");

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
  let quan = await phuong_quan.getQuan();
  let phuong = await  phuong_quan.getPhuong();
  let phuongquan = await phuong_quan.getPhuongQuan();
  return res.json({
    quan: quan,
    phuong: phuong,
    phuongquan: phuongquan
  });
}

let postKhachThue = async (req, res) => {
  let khachthue = await post_khach.postKhachThue();
  return res.json(khachthue);
}

module.exports = {
  handleLogin: handleLogin,
  handleImage: handleImage,
  getPhuongQuan: getPhuongQuan,
  postKhachThue: postKhachThue
}