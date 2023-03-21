"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class phanquyen extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  phanquyen.init(
    {
      MaPQ: {
        type: DataTypes.STRING,
        allowNull: false,
        primaryKey: true
      },
      TenPQ: DataTypes.STRING
    },
    {
      sequelize,
      modelName: "phanquyen",
      timestamps: false,
      tableName: "phanquyen",
    }
  );
  return phanquyen;
};

