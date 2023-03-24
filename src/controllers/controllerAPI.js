const e = require("cors");
const phuong_quan = require('../services/phuong_quan');
const { v4: uuidv4 } = require('uuid');
const post_khach = require("../services/post_khach");

let handleImage = async (req, res) => {
  // console.log(req.file);
}

let getPhuongQuan = async (req, res) => {
  let quan = await phuong_quan.getQuan();
  let phuong = await phuong_quan.getPhuong();
  let phuongquan = await phuong_quan.getPhuongQuan();
  return res.json({
    quan: quan,
    phuong: phuong,
    phuongquan: phuongquan
  });
}



module.exports = {
  handleImage: handleImage,
  getPhuongQuan: getPhuongQuan
}