const express = require('express');

const app = express();
app.use('/:id', (req, res) => {
    const id = req.params.id;
    // get redirection addres based on id
    // redirect to address
    res.redirect('https://google.com');
});

exports.qrcode = app;