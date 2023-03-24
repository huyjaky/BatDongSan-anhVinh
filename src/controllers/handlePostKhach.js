const e = require("cors");
const { v4: uuidv4 } = require('uuid');
const post_khach = require("../services/post_khach");

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

    const MaPhuong = req.body.MaPhuong;
    const MaQuan = req.body.MaQuan;
    const fileNames = req.files;

    // up thong tin khach len database
    const TenKhach = req.body.TenKhach;
    const TaiChinh = req.body.TaiChinh;
    const NhuCauChiTiet = req.body.NhuCauChiTiet;

    const regex = /^.*[e-].*$/;
    const Sdt = req.body.Sdt;
    if (regex.test(req.body.Sdt)) {
      Sdt = Sdt.replace(/[e-]/g, '');
    }
    const NgayDang = Date.now();
    const Linkface = req.body.Linkface;

    const postKhach = await post_khach.postKhach(
      MaKhach,
      MaViTri,
      TenKhach,
      TaiChinh,
      NhuCauChiTiet,
      Sdt,
      NgayDang,
      Linkface,
      fileNames,
      MaPhuong,
      MaQuan,
      loaikhach
    );

    return res.json('Finish');
  } catch (error) {
    return res.json(error);
  }
}

let createUUID = () => {
  const uuid = uuidv4();
  return uuid;
}

module.exports = {
  postKhach: postKhach,
}