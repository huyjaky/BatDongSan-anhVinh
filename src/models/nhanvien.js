'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class nhanvien extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  nhanvien.init({
    MaNhanVien: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    TenNhanVien: DataTypes.STRING,
    TaiKhoan: DataTypes.STRING,
    MatKhau: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'nhanvien',
    timestamps: false,
    tableName: 'nhanvien'
  });
  return nhanvien;
};

