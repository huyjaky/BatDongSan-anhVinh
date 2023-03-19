'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class quanhuyen extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  quanhuyen.init({
    MaViTri: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    MaQuan: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    TenViTri: DataTypes.STRING,
    TenPhuong: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'quanhuyen',
    timestamps: false,
    tableName: 'quanhuyen'
  });
  return quanhuyen;
};





