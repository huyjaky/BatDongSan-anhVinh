'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class quan extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      quan.hasMany(models.phuongquan, {foreignKey: 'MaQuan'});
    }
  }
  quan.init({
    MaQuan: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    TenQuan: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'quan',
    timestamps: false,
    tableName: 'quan'
  });
  return quan;
};



