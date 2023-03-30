const db = require("../models")



const change_khach = async (
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
  DanhSachHinh
) => {
  try {
    await change_diachi(MaQuan, MaPhuong, TenDuong, MaViTri);

    await DanhSachHinh.map(async (item) => {
      await postFolderAnh(item, MaAnhKhach)
      return;
    })

    if (loaikhach === 'KhachBan') {
      const change_khach = await db.khachban.update({
        TenKhach: TenKhach,
        TaiChinh: TaiChinh,
        Sdt: Sdt,
        Linkface: Linkface,
        NhuCauChiTiet: NhuCauChiTiet,
        SoPhongNgu: SoPhongNgu,
        SoPhongVeSinh: SoPhongVeSinh,
        TheLoai: TheLoai
      }, {
        where: { MaKhach: MaKhach }
      })
    } else if (loaikhach === 'KhachThue') {
      const change_khach = await db.khachthue.update({
        TenKhach: TenKhach,
        TaiChinh: TaiChinh,
        Sdt: Sdt,
        Linkface: Linkface,
        NhuCauChiTiet: NhuCauChiTiet,
        SoPhongNgu: SoPhongNgu,
        SoPhongVeSinh: SoPhongVeSinh,
        TheLoai: TheLoai
      }, {
        where: { MaKhach: MaKhach }
      })
    } else if (loaikhach === 'KhachChoThue') {
      const change_khach = await db.khachchothue.update({
        TenKhach: TenKhach,
        TaiChinh: TaiChinh,
        Sdt: Sdt,
        Linkface: Linkface,
        NhuCauChiTiet: NhuCauChiTiet,
        SoPhongNgu: SoPhongNgu,
        SoPhongVeSinh: SoPhongVeSinh,
        TheLoai: TheLoai
      }, {
        where: { MaKhach: MaKhach }
      })
    } else if (loaikhach === 'KhachMua') {
      const change_khach = await db.khachmua.update({
        TenKhach: TenKhach,
        TaiChinh: TaiChinh,
        Sdt: Sdt,
        Linkface: Linkface,
        NhuCauChiTiet: NhuCauChiTiet,
        SoPhongNgu: SoPhongNgu,
        SoPhongVeSinh: SoPhongVeSinh,
        TheLoai: TheLoai
      }, {
        where: { MaKhach: MaKhach }
      })
    }
    return console.log('finish');
  } catch (error) {
    return console.log(error);
  }
}

const change_diachi = async (MaQuan, MaPhuong, TenDuong, MaViTri) => {
  try {
    const change_diachi = await db.diachi.update({
      MaQuan: MaQuan,
      MaPhuong: MaPhuong,
      TenDuong: TenDuong
    }, {
      where: { MaViTri: MaViTri }
    })
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

module.exports = {
  change_khach: change_khach
}