const express = require('express')
const app = express()
var bodyParser = require('body-parser')

const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('./swagger.json');



require('dotenv').config()
const port = process.env.PORT

app.use(bodyParser.json()) // for parsing application/json
app.use(bodyParser.urlencoded({ extended: false}))

// app.use('/', (req, res) => {
//   return res.status(200).json({
//     success: true,
//     message: 'API runnig well',
//     data: []
//   })
// })

const routerEndpoint = require('./src/router/index')

 app.use(routerEndpoint)
 app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));


app.listen(port, () => {
  console.log(`http://localhost:${port}`)
})