const express = require('express');

const app = express();
app.use('/:id', (req, res) => {
    res.send(req.params);
});

exports.qrcode = app;