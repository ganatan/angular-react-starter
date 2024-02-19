const express = require('express');

const router = express.Router();

const continents = require('./continents');
const countries = require('./countries');

const index = require('./index');

router.use('/continents', continents);
router.use('/countries', countries);

router.use('/', index);
router.use('*', index);

module.exports = router;
