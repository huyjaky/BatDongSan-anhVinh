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

const postImage = async (img) => {
  try {
    let postImg = db.hinhanh.create({
      MaAnh: img.filename,
      Hinh: img.path
    }).then(newAnh => {
      console.log("finish upload anh!: ", newAnh);
    }).catch (err => {
      console.log(err);
    })
  } catch (err) {
    return err;
  }
}

module.exports = {
  postKhachThue: postKhachThue,
  postImage: postImage
}