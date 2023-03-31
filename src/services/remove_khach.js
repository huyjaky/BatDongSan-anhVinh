const { Sequelize, sequelize } = require("../models");
const db = require("../models");
const fs = require('fs');
const path = require('path');

const RemoveKhach = async (MaKhach, MaAnhKhach, loaikhach, MaViTri) => {
  try {
    if (loaikhach === 'KhachThue') {
      const removeKhachThue = await db.khachthue.destroy({
        where: {
          MaKhach: MaKhach
        }
      })
    } else if (loaikhach === 'KhachChoThue') {
      const removeKhachChoThue = await db.khachchothue.destroy({
        where: {
          MaKhach: MaKhach
        }
      })
    } else if (loaikhach === 'KhachBan') {
      const removeKhachBan = await db.khachban.destroy({
        where: {
          MaKhach: MaKhach
        }
      })
    } else if (loaikhach === 'KhachMua') {
      const removeKhachMua = await db.khachmua.destroy({
        where: {
          MaKhach: MaKhach
        }
      })
    }

    await RemoveFolderAnh(MaAnhKhach);
    await RemoveDiaChiTemp(MaViTri);

  } catch (error) {
    console.log(error);
    return
  }
}


const RemoveDiaChiTemp = async (MaViTri) => {
  try {
    const removeDiaChi = await db.diachi.destroy({
      where: {
        MaViTri: MaViTri
      }
    })
  } catch (error) {
    console.log(error);
    return;
  }
}

const RemoveFolderAnh = async (MaAnhKhach) => {
  try {
    const removeFolderAnh = await db.folderanh.destroy({
      where: {
        MaAnhKhach: MaAnhKhach
      }
    })
  } catch (error) {
    console.log(error);
    return;
  }
}

const RemoveHinhTemp = async () => {
  try {
    const removeHinh = await db.hinhanh.findAll({
      where: {
        MaAnh: {
          [Sequelize.Op.notIn]: sequelize.literal('(SELECT MaAnh FROM folderanh)')
        }
      }
    })

    await removeHinh.map(async(item) => {
      await removeHinhR(item.dataValues.Hinh);
      return;
    })

    const removeHinhDTB = await db.hinhanh.destroy({
      where: {
        MaAnh: {
          [Sequelize.Op.notIn]: sequelize.literal('(SELECT MaAnh FROM folderanh)')
        }
      }
    })
  } catch (error) {
    console.log(error);
    return;
  }
}

const removeHinhR = async (path1) => {
  const imagePath = path1; // Đường dẫn ảnh cần xóa
  fs.unlink(path.join(__dirname + '../../../', imagePath), (err) => {
    if (err) {
      console.error(err);
      return;
    }
    console.log('Finish');
  });
}
module.exports = {
  RemoveKhach: RemoveKhach,
  RemoveHinhTemp: RemoveHinhTemp
}