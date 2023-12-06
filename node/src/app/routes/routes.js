const express = require('express');

const router = express.Router();

const continents = require('./continents');

const index = require('./index');

router.use('/continents', continents);

router.use('/', index);
router.use('*', index);

module.exports = router;
