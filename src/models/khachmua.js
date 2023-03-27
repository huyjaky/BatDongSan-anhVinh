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
      khachmua.belongsTo(models.diachi, { foreignKey: 'MaViTri' });
      khachmua.belongsTo(models.quanlyanh, { foreignKey: 'MaAnhKhach' });
    }
  }
  khachmua.init({
    MaKhach: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
    },
    TenKhach: DataTypes.STRING,
    TaiChinh: DataTypes.DOUBLE,
    Sdt: DataTypes.STRING,
    NgayDang: {
      type: DataTypes.DATE,
      defaultValue: sequelize.NOW
    },
    Linkface: DataTypes.STRING,
    MaAnhKhach: DataTypes.STRING,
    NhuCauChiTiet: DataTypes.STRING,
      SoPhongNgu: DataTypes.STRING,
      SoPhongVeSinh: DataTypes.STRING,
      TheLoai: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'khachmua',
    timestamps: false,
    tableName: 'khachmua'
  });
  return khachmua;
};


