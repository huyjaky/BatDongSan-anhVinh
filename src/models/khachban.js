"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class khachban extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  khachban.init(
    {
      MaKhachBan: {
        type: DataTypes.STRING,
        allowNull: false,
        primaryKey: true,
      },
      TenKhach: DataTypes.STRING,
      Gia: DataTypes.DOUBLE,
      Sdt: DataTypes.STRING,
      NgayDang: DataTypes.DATE
    },
    {
      sequelize,
      modelName: "khachban",
      timestamps: false,
      tableName: "khachban",
    }
  );
  return khachban;
};
