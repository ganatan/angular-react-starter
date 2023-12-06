const express = require('express');

const app = express();
const routes = require('./app/routes/routes');

app.use('/', routes);

const port = 5003;
app.listen(port, function listenPort() {
  console.log('- PostgreSQL - Express - API RestFul CRUD');
  console.log(`- Listening on port ${port} !`);
});
