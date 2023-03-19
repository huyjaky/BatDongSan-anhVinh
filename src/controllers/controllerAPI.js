
let getHomepage = (req, res) => {
  return res.render('Homepage.ejs');
}

module.exports = {
  getHomepage: getHomepage
}