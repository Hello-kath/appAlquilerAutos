const {Auto} = require('../models')

//registrar  un nuevo Auto
exports.crearAuto = async (req, res) => {
    const { marca, modelo, year, estadoDisponi } = req.body;
    try {
        const newAuto = await Auto.create({marca, modelo, year, estadoDisponi})
        res.json(newAuto)
    } catch (e) {
        res.json({ mensaje: "error" })
    }
};