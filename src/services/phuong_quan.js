const db = require("../models");

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
  getQuan: getQuan,
  getPhuong: getPhuong,
  getPhuongQuan: getPhuongQuan
}


