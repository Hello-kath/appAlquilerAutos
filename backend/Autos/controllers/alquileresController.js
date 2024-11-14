const { Alquileres, Cliente, Auto } = require('../models');

exports.crearAlquiler = async (req, res) => {
    const { fechaInicio, fechaFin, idCliente, idAuto } = req.body;
    try {
        // Verificar si el cliente y el auto existen
        const cliente = await Cliente.findByPk(idCliente);
        const auto = await Auto.findByPk(idAuto);

        if (!cliente) {
            return res.json({ mensaje: "El cliente no existe" });
        }
        if (!auto || auto.estadoDisponi !== 'Disponible') {
            return res.json({ mensaje: "Auto no disponible" });
        }

        // Crear el nuevo alquiler
        const newAlquiler = await Alquileres.create({ 
            idCliente,
            idAuto,
            fechaInicio,
            fechaFin
        });

        // Actualizar el estado de disponibilidad del auto
        auto.estadoDisponi = 'no disponible';
        await auto.save();

        res.json(newAlquiler);
    } catch (e) {
        console.error(e); 
        res.status(500).json({ mensaje: "Error al crear el alquiler", error: e.message });
    }
};

//este muesta los autos disponibles

exports.mostrarAutosDisponi = async (req, res) => {
    try {
        const autosDisponibles = await Auto.findAll({
            where: {
                estadoDisponi: 'disponible'
            }
        });

        if (autosDisponibles.length === 0) {
            return res.json({ mensaje: "No hay autos disponibles" });
        }

        // mostrar los autos disponibles
        res.json(autosDisponibles);
    } catch (e) {
        console.error(e);
        res.json({ mensaje: "Error al mostrar los autos disponibles"});
    }
};


//este permite ver el historial de los alquileres
exports.verAlquilados = async (req, res) => {
    try {
        const autosAlquilados = await Auto.findAll({
            where: {
                estadoDisponi: 'no disponible' 
            }
        });

        if (autosAlquilados.length === 0) {
            return res.status(404).json({ mensaje: "No hay autos alquilados" });
        }

        res.json(autosAlquilados);
    } catch (error) {
        console.error(error);
        res.status(500).json({ mensaje: "Error al obtener los autos alquilados", error: error.message });
    }
};