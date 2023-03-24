'use strict';
const {
  Model
} = require('sequelize');
const phuongquan = require('./phuongquan');
module.exports = (sequelize, DataTypes) => {
  class phuong extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      phuong.hasMany(models.phuongquan , {foreignKey: 'MaQuan'});
      phuong.hasMany(models.diachi, {foreignKey: 'MaPhuong'});
    }
  }
  phuong.init({
    MaPhuong: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    TenPhuong: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'phuong',
    timestamps: false,
    tableName: 'phuong'
  });
  return phuong;
};


