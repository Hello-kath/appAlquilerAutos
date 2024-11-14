const express = require('express')
const router = express.Router()
const clienteController = require('../controllers/clienteController')

router.post('/cliente', clienteController.crearCliente)
module.exports = router