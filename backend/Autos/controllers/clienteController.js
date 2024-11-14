const {Cliente} = require('../models')

//registrar  un nuevo cliente
exports.crearCliente = async (req, res) => {
    const { nombre, correo, numLicencia } = req.body;
    try {
        const newCliente = await Cliente.create({ nombre, correo, numLicencia })
        res.json(newCliente)
    } catch (e) {
        res.json({ mensaje: "error" })
    }
};