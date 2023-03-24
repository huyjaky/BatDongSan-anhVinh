'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class khachmua extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      khachmua.belongsTo(models.diachi, {foreignKey: 'MaViTri'});
      khachmua.hasMany(models.quanlyanh, {foreignKey: 'MaKhachMua'})
    }
  }
  khachmua.init({
    MaKhachMua: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    TaiChinh: DataTypes.DOUBLE,
    TenKhach: DataTypes.STRING,
    NhuCauChiTiet: DataTypes.STRING,
    Sdt: DataTypes.STRING,
    NgayDang: DataTypes.DATE,
    Linkface: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'khachmua',
    timestamps: false,
    tableName: 'khachmua'
  });
  return khachmua;
};


