const { Sequelize, sequelize } = require('../models');
const db = require("../models");


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

const postKhach = async (MaKhach, MaViTri, TenKhach, TaiChinh, NhuCauChiTiet, Sdt, NgayDang, Linkface, DanhSachHinh, MaPhuong, MaQuan, loaikhach) => {
  try {

    // them loai khach
    if (loaikhach === 'khachban') {
      const postKhachBan = await db.khachban.create({
        MaKhachBan: MaKhach,
        MaViTri: MaViTri,
        TenKhach: TenKhach,
        Gia: TaiChinh,
        Sdt: Sdt,
        NgayDang: NgayDang,
        Linkface: Linkface,
        NhuCauChiTiet: NhuCauChiTiet
      }).then(khach => console.log(khach))
        .catch(err => console.log('loi!', err));

    } else if (loaikhach === 'khachchothue') {
      const postKhachChoThue = await db.khachchothue.create({
        MaKhachChoThue: MaKhach,
        MaViTri: MaViTri,
        TenKhachChoThue: TenKhach,
        Gia: TaiChinh,
        ThongTinChiTiet: NhuCauChiTiet,
        Sdt: Sdt,
        NgayDang: NgayDang,
        Linkface: Linkface
      }).then(khach => console.log(khach))
        .catch(err => console.log('loi!', err));

    } else if (loaikhach === 'khachthue') {
      const postKhachThue = await db.khachthue.create({
        MaKhachThue: MaKhach,
        MaViTri: MaViTri,
        TenKhachThue: TenKhach,
        TaiChinh: TaiChinh,
        NhuCauChiTiet: NhuCauChiTiet,
        Sdt: Sdt,
        NgayDang: NgayDang,
        Linkface: Linkface
      }).then(khach => console.log(khach))
        .catch(err => console.log('loi!', err));

    } else if (loaikhach === 'khachmua') {
      const postKhachMua = await db.khachmua.create({
        MaKhachMua: MaKhach,
        MaViTri: MaViTri,
        TenKhachThue: TenKhach,
        TaiChinh: TaiChinh,
        NhuCauChiTiet: NhuCauChiTiet,
        Sdt: Sdt,
        NgayDang: NgayDang,
        Linkface: Linkface
      }).then(khach => console.log(khach))
        .catch(err => console.log('loi!', err));
    }

    
    await postDiaChi(MaViTri, MaPhuong, MaQuan);


    return;
  } catch (error) {
    console.log(error);
  }
}

const postImage = async (img) => {
  try {
    let postImg = db.hinhanh.create({
      MaAnh: img.filename,
      Hinh: img.path
    }).then(newAnh => {

      console.log("finish upload anh!: ", newAnh);
    }).catch(err => {
      console.log(err);
    })
    return;
  } catch (err) {
    return err;
  }
}

const postDiaChi = async (MaViTri, MaPhuong, MaQuan) => {
  try {
    const diachi = await db.diachi.create({
      MaViTri: MaViTri,
      MaPhuong: MaPhuong,
      MaQuan: MaQuan
    }).then(diachi => console.log(diachi))
      .catch(err => console.log(err));
    return;
  } catch (error) {
    console.log(error);
    return;
  }
}

const postConnectAnh = async (MaAnh, MaKhach) => {
  try {
    const diachi = await db.quanlyanh.create({
      MaAnh: MaAnh,
      MaKhach: MaKhach
    }).then(finish => console.log(finish))
      .catch(err => console.log(err));
  } catch (error) {
    console.log(error);
    return;
  }
}

module.exports = {
  postKhach: postKhach,
  postImage: postImage
}