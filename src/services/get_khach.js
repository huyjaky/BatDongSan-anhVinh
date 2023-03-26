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

  // lay anh tu khach cho thue
  const imgKhachChoThue = await Promise.all(khachchothue.map(async (item) => {
    return await getImgKhachChoThue(item.MaAnhKhach);
  }));

  // lay anh tu khach ban
  const imgKhachBan = await Promise.all(khachban.map(async (item) => {
    return await getImgKhachBan(item.MaAnhKhach);
  }));
  console.log(imgKhachBan);

  const AllKhach = {
    khachthue: {
      khachthue,
      imgKhachThue
    },
    khachban: {
      khachban,
      imgKhachBan
    },
    khachmua: {
      khachmua,
      imgKhachMua
    },
    khachchothue: {
      khachchothue,
      imgKhachChoThue
    }
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
      include: [{
        model: db.diachi,
        required: true,
        attributes: {exclude: ['MaViTri']},
        include: [{
          model: db.phuong,
          attributes: ['TenPhuong'],
        }, {
          model: db.quan,
          attributes: ['TenQuan']
        }]
      }],
      attributes: {exclude: ['MaViTri']},
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
    const imgKhachMua = await db.hinhanh.findAll({
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
    return imgKhachMua;
  } catch (error) {
    console.log(error);
    return;
  }
}

let getKhachMua = async () => {
  try {
    const khachmua = await db.khachmua.findAll({
      include: [{
        model: db.diachi,
        required: true,
        attributes: {exclude: ['MaViTri']},
        include: [{
          model: db.phuong,
          attributes: ['TenPhuong'],
        }, {
          model: db.quan,
          attributes: ['TenQuan']
        }]
      }],
      attributes: {exclude: ['MaViTri']},
    });
    return khachmua;
  } catch (error) {
    console.log(error);
    return;
  }
}

// ----------------------------------------------------------------------------------------------

let getImgKhachChoThue = async (MaAnhKhach) => {
  try {
    const imgKhachChoThue = await db.hinhanh.findAll({
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
            model: db.khachchothue,
            where: { MaAnhKhach: MaAnhKhach },
            attributes: []
          }]
        }]
      }],
      raw: true
    })
    return imgKhachChoThue;
  } catch (error) {
    console.log(error);
    return;
  }
}

let getKhachChoThue = async () => {

  try {
    const khachchothue = await db.khachchothue.findAll({
      include: [{
        model: db.diachi,
        required: true,
        attributes: {exclude: ['MaViTri']},
        include: [{
          model: db.phuong,
          attributes: ['TenPhuong'],
        }, {
          model: db.quan,
          attributes: ['TenQuan']
        }]
      }],
      attributes: {exclude: ['MaViTri']},
    });
    return khachchothue;
  } catch (error) {
    console.log(error);
    return;
  }
}

// ----------------------------------------------------------------------------------------------
let getImgKhachBan = async (MaAnhKhach) => {
  try {
    const imgKhachBan = await db.hinhanh.findAll({
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
            model: db.khachban,
            where: { MaAnhKhach: MaAnhKhach },
            attributes: []
          }]
        }]
      }],
      raw: true
    })
    return imgKhachBan;
  } catch (error) {
    console.log(error);
    return;
  }
}

let getKhachBan = async () => {
  try {
    const khachban = await db.khachban.findAll({
      include: [{
        model: db.diachi,
        required: true,
        attributes: {exclude: ['MaViTri']},
        include: [{
          model: db.phuong,
          attributes: ['TenPhuong'],
        }, {
          model: db.quan,
          attributes: ['TenQuan']
        }]
      }],
      attributes: {exclude: ['MaViTri' ]},
    });
    return khachban;
  } catch (error) {
    console.log(error);
    return
  }
}

module.exports = {
  getKhach: getKhach
}