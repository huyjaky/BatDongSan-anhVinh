const db = require("../models");



let getKhach = async () => {
  const khachthue = await getKhachThue();
  const khachmua = await getKhachMua();
  const khachchothue = await getKhachChoThue();
  const khachban = await getKhachBan();

  // lay anh tu khach thue
  const imgKhachThue = await Promise.all(khachthue.map(async (item) => {
    return await getImgKhachThue(item.MaAnhKhach);
  }));

  // lay anh tu khach mua
  const imgKhachMua = await Promise.all(khachmua.map(async (item) => {
    return await getImgKhachMua(item.MaAnhKhach);
  }));


  const AllKhach = {
    khachthue: {
      khachthue,
      imgKhachThue
    },
    khachban: khachban,
    khachmua: {
      khachmua,
      imgKhachMua
    },
    khachchothue: khachchothue
  }
  return AllKhach;
}

// ----------------------------------------------------------------------------------------------

let getImgKhachThue = async (MaAnhKhach) => {
  try {
    const imgKhachThue = await db.hinhanh.findAll({
      attributes: ['Hinh'],
      include: [{
        model: db.folderanh,
        attributes: [],
        required: true,
        include: [{
          model: db.quanlyanh,
          attributes: [],
          required: true,
          include: [{
            model: db.khachthue,
            where: { MaAnhKhach: MaAnhKhach },
            attributes: []
          }]
        }]
      }],
      raw: true
    })
    return imgKhachThue;
  } catch (error) {
    console.log(error);
    return;
  }
}

let getKhachThue = async () => {
  try {
    const khachthue = await db.khachthue.findAll({
      raw: true
    });
    return khachthue;
  } catch (error) {
    console.log(error);
    return;
  }
}

// ----------------------------------------------------------------------------------------------

let getImgKhachMua = async (MaAnhKhach) => {
  try {
    const imgKhachThue = await db.hinhanh.findAll({
      attributes: ['Hinh'],
      include: [{
        model: db.folderanh,
        attributes: [],
        required: true,
        include: [{
          model: db.quanlyanh,
          attributes: [],
          required: true,
          include: [{
            model: db.khachmua,
            where: { MaAnhKhach: MaAnhKhach },
            attributes: []
          }]
        }]
      }],
      raw: true
    })
    return imgKhachThue;
  } catch (error) {
    console.log(error);
    return;
  }
}

let getKhachMua = async () => {
  try {
    const khachmua = await db.khachmua.findAll();
    return khachmua;
  } catch (error) {
    console.log(error);
    return;
  }
}

// ----------------------------------------------------------------------------------------------
let getKhachChoThue = async () => {
  try {
    const khachchothue = await db.khachchothue.findAll();
    return khachchothue;
  } catch (error) {
    console.log(error);
    return;
  }
}

// ----------------------------------------------------------------------------------------------
let getKhachBan = async () => {
  try {
    const khachban = await db.khachban.findAll();
    return khachban;
  } catch (error) {
    console.log(error);
    return
  }
}

module.exports = {
  getKhach: getKhach
}