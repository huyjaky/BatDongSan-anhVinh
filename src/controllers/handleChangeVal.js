const change_khach = require("../services/change_khach");
const { postImage } = require("../services/post_khach");


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



const handleChangeVal = async (req, res) => {
  // chuan bi thong tin dau vao cho su kien

  try {
    const loaikhach = req.body.khach;
    const MaViTri = req.body.MaViTri;
    const MaKhach = req.body.MaKhach;
    const MaAnhKhach = req.body.MaAnhKhach;

    const TheLoai = req.body.TheLoai;
    const SoPhongNgu = req.body.SoPhongNgu;
    const SoPhongVeSinh = req.body.SoPhongVeSinh;
    const MaPhuong = req.body.MaPhuong;
    const MaQuan = req.body.MaQuan;
    const TenDuong = req.body.TenDuong;

    const TenKhach = req.body.TenKhach;
    const TaiChinh = req.body.TaiChinh;
    const NhuCauChiTiet = req.body.NhuCauChiTiet;

    const regex = /^.*[e-].*$/;
    const Sdt = req.body.Sdt;
    if (regex.test(req.body.Sdt)) {
      Sdt = Sdt.replace(/[e-]/g, '');
    }
    const Linkface = req.body.Linkface;

    const fileNames = await arrImg;
    const empty = [];
    arrImg = empty;

    await change_khach.change_khach(
      loaikhach,
      MaViTri,
      MaKhach,
      MaAnhKhach,
      TheLoai,
      SoPhongNgu,
      SoPhongVeSinh,
      MaPhuong,
      MaQuan,
      TenDuong,
      TenKhach,
      TaiChinh,
      NhuCauChiTiet,
      Sdt,
      Linkface,
      fileNames
    );
    return res.json('finish');
  } catch (error) {
    return res.json(error);
  }
}
module.exports = {
  handleChangeVal: handleChangeVal,
  upImg: upImg
}