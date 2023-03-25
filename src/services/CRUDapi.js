const db = require("../models")

let getNhanvien = () => {
  return new Promise(async (resolve, reject) => {
    try {
      let data = await db.nhanvien.findAll();
      console.log(data);
      resolve(data);
    } catch (error) {
      reject(error);
    }
  })

}

module.exports = {
  getNhanvien: getNhanvien
}