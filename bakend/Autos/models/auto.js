'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Auto extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Auto.init({
    marca: DataTypes.STRING,
    modelo: DataTypes.STRING,
    year: DataTypes.INTEGER,
    estadoDisponi: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Auto',
    tableName: 'autos'
  });
  return Auto;
};