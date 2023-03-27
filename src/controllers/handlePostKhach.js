const e = require("cors");
const { v4: uuidv4 } = require('uuid');
const { postImage } = require("../services/post_khach");
const post_khach = require("../services/post_khach");

var arrImg = [];

let upImg = async (req, res) => {
  try {
    const files = await req.files;
    files.map(async item => {
      await postImage(item);
      arrImg.push(item);
    });
    return res.json('Finish UpImg');
  } catch (error) {
    return res.json(error);
  }
}


let postKhach = async (req, res) => {
  try {
    // MaKhachBan x
    // MaViTri x
    // TenKhach x
    // Gia/TaiChinh x
    // ThongTinChiTiet/NhuCauChiTiet x
    // Sdt x
    // NgayDang x
    // Linkface x

    //MaAnh x
    //Hinh x

    // MaViTri x
    // MaPhuong x
    // MaQuan x

    const loaikhach = req.body.khach;
    const MaViTri = createUUID();
    const MaKhach = createUUID();
    const MaAnhKhach = createUUID();

    const TheLoai = req.body.TheLoai;
    const SoPhongNgu = req.body.SoPhongNgu;
    const SoPhongVeSinh = req.body.SoPhongVeSinh;
    const MaPhuong = req.body.MaPhuong;
    const MaQuan = req.body.MaQuan;
    const TenDuong = req.body.TenDuong;
    const fileNames = await arrImg;
    const empty = [];
    arrImg = empty;

    // up thong tin khach len database
    const TenKhach = req.body.TenKhach;
    const TaiChinh = req.body.TaiChinh;
    const NhuCauChiTiet = req.body.NhuCauChiTiet;

    const regex = /^.*[e-].*$/;
    const Sdt = req.body.Sdt;
    if (regex.test(req.body.Sdt)) {
      Sdt = Sdt.replace(/[e-]/g, '');
    }
    const Linkface = req.body.Linkface;

    const postKhach = await post_khach.postKhach(
      MaKhach,
      MaViTri,
      MaAnhKhach,
      TenDuong,
      TenKhach,
      TaiChinh,
      NhuCauChiTiet,
      Sdt,
      Linkface,
      fileNames,
      MaPhuong,
      MaQuan,
      loaikhach,
      SoPhongNgu,
      SoPhongVeSinh,
      TheLoai
    );
    return res.json('finish');
  } catch (error) {
    return res.json('error');
  }
}

let createUUID = () => {
  const uuid = uuidv4();
  return uuid;
}



module.exports = {
  postKhach: postKhach,
  upImg: upImg
}