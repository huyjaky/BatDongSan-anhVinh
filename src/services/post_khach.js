const db = require("../models");

const postKhach = async (MaKhach, MaViTri, MaAnhKhach, TenDuong, TenKhach, TaiChinh, NhuCauChiTiet, Sdt, Linkface, DanhSachHinh, MaPhuong, MaQuan, loaikhach) => {
  try {
    await postDiaChi(MaViTri, MaPhuong, MaQuan, TenDuong);
    await postQuanLyAnh(MaAnhKhach);

    await DanhSachHinh.map(async (item) => {
      await postFolderAnh(item, MaAnhKhach)
      return;
    })

    // them loai khach
    if (loaikhach === 'Khach Ban') {
      const postKhachBan = await db.khachban.create({
        MaKhach: MaKhach,
        MaViTri: MaViTri,
        TenKhach: TenKhach,
        TaiChinh: TaiChinh,
        Sdt: Sdt,
        Linkface: Linkface,
        NgayDang: new Date(),
        MaAnhKhach: MaAnhKhach,
        NhuCauChiTiet: NhuCauChiTiet
      }).then(khach => console.log(khach))
        .catch(err => console.log('loi!', err));

    } else if (loaikhach === 'Khach Cho Thue') {
      const postKhachChoThue = await db.khachchothue.create({
        MaKhach: MaKhach,
        MaViTri: MaViTri,
        TenKhach: TenKhach,
        TaiChinh: TaiChinh,
        Sdt: Sdt,
        Linkface: Linkface,
        NgayDang: new Date(),
        MaAnhKhach: MaAnhKhach,
        NhuCauChiTiet: NhuCauChiTiet
      }).then(khach => console.log(khach))
        .catch(err => console.log('loi!', err));

    } else if (loaikhach === 'Khach Thue') {
      const postKhachThue = await db.khachthue.create({
        MaKhach: MaKhach,
        MaViTri: MaViTri,
        TenKhach: TenKhach,
        TaiChinh: TaiChinh,
        Sdt: Sdt,
        Linkface: Linkface,
        NgayDang: new Date(),
        MaAnhKhach: MaAnhKhach,
        NhuCauChiTiet: NhuCauChiTiet
      }).then(khach => console.log(khach))
        .catch(err => console.log('loi!', err));

    } else if (loaikhach === 'Khach Mua') {
      const postKhachMua = await db.khachmua.create({
        MaKhach: MaKhach,
        MaViTri: MaViTri,
        TenKhach: TenKhach,
        TaiChinh: TaiChinh,
        Sdt: Sdt,
        Linkface: Linkface,
        NgayDang: new Date(),
        MaAnhKhach: MaAnhKhach,
        NhuCauChiTiet: NhuCauChiTiet
      }).then(khach => console.log(khach))
        .catch(err => console.log('loi!', err));
    }
    return;
  } catch (error) {
    console.log(error);
  }
}

const postQuanLyAnh = async (MaAnhKhach) => {
  try {
    const quanlyanh = await db.quanlyanh.create({
      MaAnhKhach: MaAnhKhach,
    }).then(finish => console.log(finish))
      .catch(err => console.log(err));
  } catch (error) {
    console.log(error);
    return;
  }
}

const postFolderAnh = async (Img, MaAnhKhach) => {
  try {
    const folderanh = await db.folderanh.create({
      MaAnh: Img.filename,
      MaAnhKhach: MaAnhKhach,
      id: MaAnhKhach
    }).then(finish => console.log(finish))
      .catch(err => console.log(err));
  } catch (error) {
    console.log(error);
    return;
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

const postDiaChi = async (MaViTri, MaPhuong, MaQuan, TenDuong) => {
  try {
    const diachi = await db.diachi.create({
      MaViTri: MaViTri,
      MaPhuong: MaPhuong,
      MaQuan: MaQuan,
      TenDuong: TenDuong
    }).then(diachi => console.log(diachi))
      .catch(err => console.log(err));
    return;
  } catch (error) {
    console.log(error);
    return;
  }
}


module.exports = {
  postKhach: postKhach,
  postImage: postImage
}