const e = require("cors");
const phuong_quan = require('../services/phuong_quan');
const { v4: uuidv4 } = require('uuid');
const post_khach = require("../services/post_khach");

let postKhachThue_KhachMua = async (req, res) => {
  try {
    // up anh len database
    const fileNames = req.files.map(async (item) => {
      return await post_khach.postImage(item);
    });

    // up thong tin khach len database
    const MaKhach = createUUID();
    const TaiChinh = req.body.TaiChinh;
    const TenKhach = req.body.TenKhach;
    const NhuCauChiTiet = req.body.NhuCauChiTiet;

    const regex = /^.*[e-].*$/;
    const Sdt = req.body.Sdt;
    if (regex.test(req.body.Sdt)) {
      Sdt.replace(/[e-]/g, '');
    }

    const NgayDang = Date.now();
    const Linkface = req.body.Linkface;


    
    const MaViTri = createUUID();
    return res.json('Finish up anh');
  } catch (error) {
    return res.json('err!', err)
  }
}

let createUUID = () => {
  const uuid = uuidv4();
  return uuid;
}

module.exports = {
  postKhachThue_KhachMua: postKhachThue_KhachMua
}