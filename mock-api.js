'use strict';

const express = require('express');
const router = express.Router();
const data = require('./mock-data.js');

router.route('/')
  .get((req, res, next) => {
    res.json(data);
  });

let app = express();

app.use('/events', router);

app.listen(4000, () => {
  console.log('api listening on port 4000...');
});
