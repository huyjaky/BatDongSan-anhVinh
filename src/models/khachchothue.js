'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class khachchothue extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  khachchothue.init({
    MaKhachChoThue: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    MaViTri: DataTypes.STRING,
    TenKhachChoThue: DataTypes.STRING,
    Gia: DataTypes.DOUBLE,
    ThongTinChiTiet: DataTypes.STRING,
    Sdt: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'khachchothue',
    timestamps: false,
    tableName: 'khachchothue'
  });
  return khachchothue;
};

