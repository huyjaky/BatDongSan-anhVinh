'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class diachi extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      diachi.hasOne(models.khachthue, {foreignKey: 'MaViTri'});
      diachi.belongsTo(models.quan, {foreignKey: 'MaQuan'});
      diachi.belongsTo(models.phuong, {foreignKey: 'MaPhuong'});
    }
  }
  diachi.init({
    MaViTri: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    MaPhuong: {
      type: DataTypes.STRING,
      allowNull: false,
      model: 'phuong',
      references: 'MaPhuong'
    },
    MaQuan: {
      type: DataTypes.STRING,
      allowNull: false,
      model: 'quan',
      references: 'MaQuan'
    },
    TenDuong: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'diachi',
    timestamps: false,
    tableName: 'diachi'
  });

  return diachi;
};

