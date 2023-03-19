const CRUDapi = require("../services/CRUDapi");

let getHomepage = async (req, res) => {
  let data = await CRUDapi.getNhanvien();
  return res.json(data);
}

module.exports = {
  getHomepage: getHomepage
}