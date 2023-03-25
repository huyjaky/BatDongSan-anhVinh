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
      khachchothue.belongsTo(models.diachi, { foreignKey: 'MaViTri' });
      khachchothue.belongsTo(models.quanlyanh, {foreignKey: 'MaAnhKhach'});
    }
  }
  khachchothue.init({
    MaKhachChoThue: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    TenKhachChoThue: DataTypes.STRING,
    Gia: DataTypes.DOUBLE,
    ThongTinChiTiet: DataTypes.STRING,
    Sdt: DataTypes.STRING,
    NgayDang: {
      type: DataTypes.DATE,
      defaultValue: sequelize.NOW
    },
    Linkface: DataTypes.STRING,
    MaAnhKhach: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'khachchothue',
    timestamps: false,
    tableName: 'khachchothue'
  });
  return khachchothue;
};

