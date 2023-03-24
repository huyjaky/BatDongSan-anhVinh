"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class hinhanh extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      hinhanh.hasMany(models.quanlyanh, {foreignKey: 'MaAnh'});
    }
  }
  hinhanh.init(
    {
      MaAnh: {
        type: DataTypes.STRING,
        allowNull: false,
        primaryKey: true,
      },
      Hinh: DataTypes.STRING
    },
    {
      sequelize,
      modelName: "hinhanh",
      timestamps: false,
      tableName: "hinhanh",
    }
  );
  return hinhanh;
};

