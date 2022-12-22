const express = require('express');
const { initializeApp } = require('firebase-admin/app');
const { getFirestore } = require('firebase-admin/firestore');

initializeApp();
const db = getFirestore();

const app = express();
app.use('/:id', async (req, res) => {
    const id = req.params.id;
    const destination_adress = db.collection('destination_adresses').doc(id);
    const doc = await document.get();
    res.send(doc)
    // res.redirect(destination_adress.data());
});

exports.qrcode = app;