const express = require('express');
const config = require('../config/config');

const router = express.Router();
const appName = config.appName;
const type = config.type;
const url = config.url;
const port = config.port;

router.get('/', function (req, res) {
  let env = process.env.NODE_ENV;
  if (env === undefined) {
    env = 'undefined';
  }
  res.json(
    {
      environment: env,
      applicationName: appName,
      type: type,
      url: url,
      port: port,
    },
  );
});

router.get('*', function (req, res) {
  const item = { error: 'notfound' };
  res.send(item);
});

module.exports = router;
