"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class anh extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  anh.init(
    {
      MaAnh: {
        type: DataTypes.STRING,
        allowNull: false,
        primaryKey: true,
      },
      Anh: DataTypes.STRING
    },
    {
      sequelize,
      modelName: "anh",
      timestamps: false,
      tableName: "anh",
    }
  );
  return anh;
};

