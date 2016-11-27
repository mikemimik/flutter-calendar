'use strict';

const express = require('express');
const router = express.Router();
const data = require('./mock-data.js');

const PORT = 4000;

router.route('/')
  .get((req, res, next) => {
    res.json(data);
  });

let app = express();

app.use('/events', router);

app.listen(PORT, () => {
  console.log(`api listening on port ${PORT}...`);
});
