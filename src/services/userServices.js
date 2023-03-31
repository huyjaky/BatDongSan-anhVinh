const db = require("../models");

const handleUserLogin = async (TaiKhoan, MatKhau) => {
  try {
    let userData = {};
    const result = await checkNhanVien(TaiKhoan, MatKhau);
    const isExist = result.isExist;
    const user = result.user;
    if (isExist) {
      return user;
    } else {
      userData.errCode = 1;
      userData.errMessage = 'Your Email or Password not exist!';
      return userData;
    }
  } catch (error) {
    throw error;
  }
}

const checkNhanVien = async (TaiKhoan, MatKhau) => {
  try {
    const user = await db.nhanvien.findOne({
      where: { TaiKhoan: TaiKhoan, MatKhau: MatKhau },
      attributes: ['MaNhanVien', 'TaiKhoan', 'MaPQ']
    })
    if (user) {
      return { isExist: true, user: user };
    } else {
      return { isExist: false, user: user };
    }
  } catch (error) {
    throw error;
  }
}



module.exports = {
  handleUserLogin: handleUserLogin,
}

