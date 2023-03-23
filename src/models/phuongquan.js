'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class phuongquan extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      phuongquan.belongsTo(models.quan, { foreignKey: 'MaQuan' });
      phuongquan.belongsTo(models.phuong, { foreignKey: 'MaPhuong' });
    }
  }
  phuongquan.init({
    MaQuan: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'quan',
        key: 'MaQuan'
      }
    },
    MaPhuong: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'phuong',
        key: 'MaPhuong'
      }
    },
  }, {
    sequelize,
    modelName: 'phuongquan',
    timestamps: false,
    tableName: 'phuongquan',
  });

  return phuongquan;
};




