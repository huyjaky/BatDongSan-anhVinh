const { on } = require('nodemon');
const { Sequelize, sequelize } = require('../models');
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
      attributes: ['MaNhanVien', 'TaiKhoan']
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

const getQuan = async () => {
  try {
    const quan = await db.quan.findAll();
    return quan;
  } catch (error) {
    throw error;
  }
}

const getPhuong = async () => {
  try {
    const phuong = await db.phuong.findAll();
    return phuong;
  } catch (error) {
    throw error;
  }
}

const getPhuongQuan = async () => {
  try {
    const result = await db.phuongquan.findAll({
      attributes: { exclude: ['id', 'MaPhuong'] },
      include: [{
        model: db.quan
      },
      {
        model: db.phuong
      }
      ],
      raw: true,
    })
    return result;
  } catch (error) {
    console.log(error);
  }
}



module.exports = {
  handleUserLogin: handleUserLogin,
  getQuan: getQuan,
  getPhuong: getPhuong,
  getPhuongQuan: getPhuongQuan
}

