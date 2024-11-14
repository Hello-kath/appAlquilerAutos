'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Alquileres extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Alquileres .belongsTo(models.Cliente, {
        foreignKey: 'idCliente',
        as: 'clientes',
        onDelete: 'CASCADE'
      }),

      Alquileres .belongsTo(models.Auto, {
        foreignKey: 'idAuto',
        as: 'autos',
        onDelete: 'CASCADE'
      })
    }
  }
  Alquileres.init({
    fechaInicio: DataTypes.DATE,
    fechaFin: DataTypes.DATE
  }, {
    sequelize,
    modelName: 'Alquileres',
    tableName: 'alquileres'
  });
  return Alquileres;
};