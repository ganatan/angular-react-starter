const express = require('express');
const http = require('http');
const path = require('path');

const app = express();

const port = process.env.port || 3001;

app.use(express.static(__dirname + '/dist/angular-starter'));

app.get('/*', (req, res) => res.sendFile(path.join(__dirname)));

const server = http.createServer(app);

server.listen(port,() => console.log('Running on port ' + port));

