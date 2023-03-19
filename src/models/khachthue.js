'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class khachthue extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  khachthue.init({
    MaKhachThue: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    MaViTri: DataTypes.STRING,
    TenKhachThue: DataTypes.STRING,
    TaiChinh: DataTypes.DOUBLE,
    NhuCauChiTiet: DataTypes.STRING,
    Sdt: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'khachthue',
    timestamps: false,
    tableName: 'khachthue'
  });
  return khachthue;
};



