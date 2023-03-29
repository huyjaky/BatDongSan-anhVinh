const remove_khach = require("../services/remove_khach");


const RemoveKhach = async (req, res) => {

  try {
    // dua vao du lieu up len
    // dau vao cua khach la mot mang khach
    const khach = req.body.khach
    const loaikhach = req.body.loaikhach;


    RemoveHinhTemp();
    const MaKhach = khach.MaKhach;
    const MaAnhKhach = khach.MaAnhKhach;
    const MaViTri = khach.MaViTri;

    const removekhach = await remove_khach.RemoveKhach(MaKhach, MaAnhKhach, loaikhach, MaViTri);
    return res.send('finish');
  } catch (error) {
    return res.send('error');
  }
}

const RemoveHinhTemp = async (req, res) => {
  try {
    const remove = remove_khach.RemoveHinhTemp();
    return res.send('finish');
  } catch (error) {
    console.log(error);
    return res.send('error');
  }
}

module.exports = {
  RemoveHinhTemp: RemoveHinhTemp,
  RemoveKhach: RemoveKhach
}