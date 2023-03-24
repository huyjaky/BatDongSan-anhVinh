const { Sequelize, sequelize } = require('../models');
const db = require("../models");

const postKhachThue = async () => {
  try {
    let khachthue = await db.khachthue.findAll({
      include: [{
        model: db.diachi,
        required: true,
        attributes: { exclude: ['MaViTri'] },
        include: [{
          model: db.phuong,
          required: true
        }, {
          model: db.quan,
          required: true
        }]
      }],
      attributes: { exclude: ['NgayDang', 'MaViTri'] },
      raw: true
    })
    return khachthue;
  } catch (error) {
    console.log(error);
  }

}

module.exports = {
  postKhachThue: postKhachThue
}