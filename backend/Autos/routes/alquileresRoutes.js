const express = require('express')
const router = express.Router()
const alquilerController = require('../controllers/alquileresController')

router.post('/alquiler', alquilerController.crearAlquiler)
router.get('/alquiler', alquilerController.mostrarAutosDisponi)
router.get('/alquilados', alquilerController.verAlquilados)
module.exports = router