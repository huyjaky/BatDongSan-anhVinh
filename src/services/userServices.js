const db = require("../models");


let handleUserLogin = (TenNhanVien, MatKhau) => {
  return new Promise( async (resolve, reject) => {
    try {
      let userData = {};
      let result = await checkNhanVien(TenNhanVien, MatKhau);
      let isExist = result.isExist;
      let user = result.user;
      if (isExist) {
        resolve(user);
      } else {
        userData.errCode = 1;
        userData.errMessage = 'Your Email or Password not exist!';
        resolve(userData);
      }
    } catch (error) {
      reject(error);
    }
  })
}


let checkNhanVien = (TenNhanVien, MatKhau) => {
  return new Promise( async (resolve, reject) => {
    try {
      let user = await db.nhanvien.findOne({
        where: {TenNhanVien: TenNhanVien, MatKhau: MatKhau},
        attributes: [ 'MaNhanVien','TenNhanvien']
      })
      if (user) {
        resolve({isExist: true, user:user});
      } else {
        resolve({isExist: false, user:user});
      }
    } catch (error) {
      reject(error);
    }
  })
}


module.exports = {
  handleUserLogin: handleUserLogin
}

