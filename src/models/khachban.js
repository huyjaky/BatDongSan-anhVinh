"use strict";
const { Model } = require("sequelize");
const { Sequelize } = require(".");
module.exports = (sequelize, DataTypes) => {
  class khachban extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      khachban.belongsTo(models.diachi, { foreignKey: 'MaViTri' });
      khachban.belongsTo(models.quanlyanh, {foreignKey: 'MaAnhKhach'});
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
      NgayDang: {
        type: DataTypes.DATE,
        defaultValue: sequelize.NOW
      },
      Linkface: DataTypes.STRING,
      MaAnhKhach: DataTypes.STRING,
      NhuCauChiTiet: DataTypes.STRING
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
