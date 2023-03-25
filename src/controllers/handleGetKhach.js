const get_khach = require("../services/get_khach");

let getAllKhach = async (req, res) => {
  try {
    const arrKhach = await get_khach.getKhach();
    return res.json(arrKhach);
  } catch (error) {
    return res.json(error);
  }
};



module.exports = {
  getAllKhach: getAllKhach,
}