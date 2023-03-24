"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class quanlyanh extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      quanlyanh.belongsTo(models.khachchothue, {foreignKey: 'MaKhach'});
      quanlyanh.belongsTo(models.khachthue, {foreignKey: 'MaKhach'});
      quanlyanh.belongsTo(models.khachmua, {foreignKey: 'MaKhach'});
      quanlyanh.belongsTo(models.khachban, {foreignKey: 'MaKhach'});

      quanlyanh.belongsTo(models.hinhanh, {foreignKey: 'MaAnh'});
    }
  }
  quanlyanh.init(
    {
      MaAnh: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      MaKhach: {
        type: DataTypes.STRING,
        allowNull: false,
      },
    },
    {
      sequelize,
      modelName: "quanlyanh",
      timestamps: false,
      tableName: "quanlyanh",
    }
  );
  return quanlyanh;
};

