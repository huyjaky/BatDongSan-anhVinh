"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class folderanh extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      folderanh.belongsTo(models.hinhanh, {foreignKey: 'MaAnh'});
      folderanh.belongsTo(models.quanlyanh, {foreignKey: 'MaAnhKhach'});
    }
  }
  folderanh.init(
    {
      MaAnhKhach: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      MaAnh: {
        type: DataTypes.STRING,
        allowNull: false,
      }
    },
    {
      sequelize,
      modelName: "folderanh",
      timestamps: false,
      tableName: "folderanh",
    }
  );
  return folderanh;
};


