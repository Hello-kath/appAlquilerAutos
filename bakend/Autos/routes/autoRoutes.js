const express = require('express')
const router = express.Router()
const autoController = require('../controllers/autoController')

router.post('/auto', autoController.crearAuto)
module.exports = router