const express = require('express');

const app = express();

const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');

const routes = require('./app/routes/routes');

const swaggerDocument = YAML.load('./swagger.yaml');

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.use('/', routes);

const port = 5000;
app.listen(port, function listenPort() {
  console.log('- PostgreSQL - Express - API RestFul CRUD');
  console.log(`- Listening on port ${port} !`);
});
