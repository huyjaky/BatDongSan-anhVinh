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
  }, {
    sequelize,
    modelName: 'diachi',
    timestamps: false,
    tableName: 'diachi'
  });

  return diachi;
};

