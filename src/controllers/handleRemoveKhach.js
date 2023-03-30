const remove_khach = require("../services/remove_khach");


const RemoveKhach = async (req, res) => {

  try {
    // dua vao du lieu up len
    // dau vao cua khach la mot mang khach
    const khach = req.body.khach
    const loaikhach = req.body.loaikhach;


    const MaKhach = khach.khach.MaKhach;
    const MaAnhKhach = khach.khach.MaAnhKhach;
    const MaViTri = khach.khach.MaViTri;

    const removekhach = await remove_khach.RemoveKhach(MaKhach, MaAnhKhach, loaikhach, MaViTri);
    remove_khach.RemoveHinhTemp();
    return res.json('finish');
  } catch (error) {
    return res.json('error');
  }
}


module.exports = {
  RemoveKhach: RemoveKhach
}