const express = require ('express')
const app = express()
require('dotenv').config()
const clienteRoutes = require('./routes/clienteRoutes')
const autoRoutes = require('./routes/autoRoutes')
const alquilerRoutes = require('./routes/alquileresRoutes')
const PORT = process.env.puertoAuto

app.use(express.json())

app.use('/api', clienteRoutes)
app.use('/api', autoRoutes)
app.use('/api', alquilerRoutes)

app.listen(PORT, () => {
    console.log("servidor corriendo", PORT)
})